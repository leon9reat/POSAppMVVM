unit View.MainForm;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes,
    System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
    ViewModel.Main, Model.Main, Model.ProSu.Interfaces, Model.Interfaces;

type
    TMainForm = class(TForm)
        LabelTitle: TLabel;
        LabelTotalSales: TLabel;
        LabelTotalSalesFigure: TLabel;
        ButtonInvoice: TButton;
        procedure FormCreate(Sender: TObject);
        procedure ButtonInvoiceClick(Sender: TObject);
    private
        { Private declarations }
        fViewModel: IMainViewModelInterface;
        fSubscriber: ISubscriberInterface;
        procedure setViewModel(const newViewModel: IMainViewModelInterface);
        procedure updateLabels;
        procedure updateTotalSalesFigure;
        procedure notificationFromProvider(const notifyClass:
            INotificationClass);

    public
        { Public declarations }
        property ViewModel: IMainViewModelInterface read fViewModel write setViewModel;
    end;

var
    MainForm: TMainForm;

implementation

uses
    Model.ProSu.Subscriber, View.TestPrintInvoice, Declarations, Model.ProSu.InterfaceActions;

{$R *.fmx}

{ TMainForm }

procedure TMainForm.ButtonInvoiceClick(Sender: TObject);
var
    tmpTest: TTestPrintInvoiceForm;
begin
    tmpTest := TTestPrintInvoiceForm.Create(Self);
    tmpTest.Provider.subscribe(fSubscriber);
    tmpTest.Show;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
    fSubscriber := TProSuSubscriber.Create;
    fSubscriber.setUpdateSubscriberMethod(notificationFromProvider);
end;

procedure TMainForm.notificationFromProvider(
    const notifyClass: INotificationClass);
var
    tmpNotifClass: TNotificationClass;
begin
    if notifyClass is TNotificationClass then
    begin
        tmpNotifClass := notifyClass as TNotificationClass;
        if actUpdateTotalSalesFigure in tmpNotifClass.actions then
            LabelTotalSalesFigure.Text := Format('%10.2f', [tmpNotifClass.ActionValue]);

    end;

end;

procedure TMainForm.setViewModel(const newViewModel: IMainViewModelInterface);
begin
    fViewModel := newViewModel;
    if not Assigned(fViewModel) then
        raise Exception.Create('Main View Model is required');

    updateLabels;
    updateTotalSalesFigure;
end;

procedure TMainForm.updateLabels;
begin
    LabelTitle.Text := fViewModel.LabelsText.Title;
    LabelTotalSales.Text := fViewModel.LabelsText.TotalSalesText;
    LabelTotalSalesFigure.Text := fViewModel.getTotalSalesValue;
end;

procedure TMainForm.updateTotalSalesFigure;
begin
    ButtonInvoice.Text := fViewModel.LabelsText.IssueButtonCaption;
end;

end.

