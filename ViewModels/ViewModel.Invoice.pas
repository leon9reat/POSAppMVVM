unit ViewModel.Invoice;

interface

uses
    Model.Interfaces;

function CreateInvoiceViewModelClass: IInvoiceViewModelInterface;

implementation

uses
    Declarations, System.SysUtils, System.Generics.Collections;

type
    TInvoiceViewModel = class(TInterfacedObject, IInvoiceViewModelInterface)
    private
        fModel: IInvoiceModelInterface;
        fLabelsText: TInvoiceFormLabelsText;
        fInvoiceItemsEnabled,
            fBalanceEnabled,
            fPrintButtonEnabled,
            fAniIndicatorVisible,
            fPrintingLabelVisible: boolean;
        function GetModel: IInvoiceModelInterface;
        function GetLabelsText: TInvoiceFormLabelsText;
        function GetTitleText: string;
        function GetGroupBoxInvoiceItemsEnabled: Boolean;
        function GetGroupBoxBalanceEnabled: Boolean;
        function GetButtonPrintInvoiceEnabled: Boolean;
        function GetAniIndicatorProgressVisible: Boolean;
        function GetLabelPrintingVisible: Boolean;
        procedure SetModel(const newModel: IInvoiceModelInterface);
        procedure GetCustomerList(var customers: TObjectList<TCustomer>);
        procedure GetItems(var items: TObjectList<TItem>);
    public
        constructor Create;
        property Model: IInvoiceModelInterface read GetModel write SetModel;
        property LabelsText: TInvoiceFormLabelsText read GetLabelsText;
    end;

function CreateInvoiceViewModelClass: IInvoiceViewModelInterface;
begin
    Result := TInvoiceViewModel.Create;
end;

{ TInvoiceViewModel }

constructor TInvoiceViewModel.Create;
begin
    fInvoiceItemsEnabled := false;
    fBalanceEnabled := false;
    fPrintButtonEnabled := false;
    fAniIndicatorVisible := false;
    fPrintingLabelVisible := false;
end;

function TInvoiceViewModel.GetAniIndicatorProgressVisible: Boolean;
begin
    result := fAniIndicatorVisible;
end;

function TInvoiceViewModel.GetButtonPrintInvoiceEnabled: Boolean;
begin
    result := fPrintButtonEnabled;
end;

procedure TInvoiceViewModel.GetCustomerList(
    var customers: TObjectList<TCustomer>);
begin
    if not Assigned(fModel) then
        Exit;
    fModel.GetCustomerList(customers);

end;

function TInvoiceViewModel.GetGroupBoxBalanceEnabled: Boolean;
begin
    result := fBalanceEnabled;
end;

function TInvoiceViewModel.GetGroupBoxInvoiceItemsEnabled: Boolean;
begin
    Result := fInvoiceItemsEnabled;
end;

procedure TInvoiceViewModel.GetItems(var items: TObjectList<TItem>);
begin
    if not Assigned(fModel) then
        Exit;
    fModel.GetItems(items);
end;

function TInvoiceViewModel.GetLabelPrintingVisible: Boolean;
begin
    result := fPrintingLabelVisible;
end;

function TInvoiceViewModel.GetLabelsText: TInvoiceFormLabelsText;
begin
    Result := fModel.GetInvoiceFormLabelsText;
end;

function TInvoiceViewModel.GetModel: IInvoiceModelInterface;
begin
    Result := fModel;
end;

function TInvoiceViewModel.GetTitleText: string;
var
    tmpInvoice: TInvoice;
begin
    fModel.GetInvoice(tmpInvoice);
    Result := fModel.GetInvoiceFormLabelsText.Title + ' #'
        + IntToStr(tmpInvoice.Number);
end;

procedure TInvoiceViewModel.SetModel(const newModel: IInvoiceModelInterface);
begin
    fModel := newModel;
end;

end.

