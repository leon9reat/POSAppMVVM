unit View.TestPrintInvoice;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes,
        System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
    Model.ProSu.Interfaces, Model.ProSu.Provider;

type
    TTestPrintInvoiceForm = class(TForm)
        ButtonPrintInvoice: TButton;
        procedure FormCreate(Sender: TObject);
    procedure ButtonPrintInvoiceClick(Sender: TObject);
    private
        { Private declarations }
        fProvider: IProviderInterface;
    public
        { Public declarations }
        property Provider: IProviderInterface read fProvider;
    end;

var
    TestPrintInvoiceForm: TTestPrintInvoiceForm;

implementation

uses
    Declarations, Model.ProSu.InterfaceActions;

{$R *.fmx}

procedure TTestPrintInvoiceForm.ButtonPrintInvoiceClick(Sender: TObject);
var
    tmpNotificationClass: TNotificationClass;
begin
    tmpNotificationClass := TNotificationClass.Create;
    try
        tmpNotificationClass.actions := [actUpdateTotalSalesFigure];
        tmpNotificationClass.ActionValue := Random(1300);
        fProvider.notifySubscribers(tmpNotificationClass);
    finally
        tmpNotificationClass.Free;
    end;
end;

procedure TTestPrintInvoiceForm.FormCreate(Sender: TObject);
begin
    fProvider := TProSuProvider.Create;
end;

end.

