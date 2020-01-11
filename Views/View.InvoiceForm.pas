unit View.InvoiceForm;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes,
    System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
    FMX.Menus, FMX.StdCtrls, FMX.Objects, FMX.Grid, FMX.Layouts,
    FMX.Controls.Presentation, FMX.Edit, FMX.ExtCtrls, Model.Interfaces;

type
    TInvoiceForm = class(TForm)
        ScrollBox1: TScrollBox;
        AniIndicatorProgress: TAniIndicator;
        ButtonCancel: TButton;
        ButtonPrintInvoice: TButton;
        GroupBoxBalance: TGroupBox;
        LabelRunningBalance: TLabel;
        LabelInvBalance: TLabel;
        CheckBoxDiscount: TCheckBox;
        LabelDiscount: TLabel;
        LineHorizontal: TLine;
        LabelTotalBalance: TLabel;
        LabelTotal: TLabel;
        GroupBoxCustomerDetails: TGroupBox;
        LabelCustomer: TLabel;
        PopupBoxCustomer: TPopupBox;
        LabelDiscountRate: TLabel;
        LabelDiscountRateFigure: TLabel;
        LabelTotalBalanceBig: TLabel;
        LabelOutstandingBalance: TLabel;
        GroupBoxInvoiceItems: TGroupBox;
        PopupBoxItems: TPopupBox;
        LabelItem: TLabel;
        LabelQuantity: TLabel;
        EditQuantity: TEdit;
        ButtonAddItem: TButton;
        StringGridItems: TStringGrid;
        StringColumn1: TStringColumn;
        StringColumn2: TStringColumn;
        StringColumn3: TStringColumn;
        StringColumn4: TStringColumn;
        StringColumn5: TStringColumn;
        LabelInvoiceBalance: TLabel;
        LabelPrinting: TLabel;
        LabelTitle: TLabel;
    private
        { Private declarations }
        fViewModel: IInvoiceViewModelInterface;
        procedure SetViewModel(const newViewModel: IInvoiceViewModelInterface);
        procedure UpdateLabels;
        procedure SetupGUI;
        procedure UpdateGroups;
        procedure UpdatePrintingStatus;
    public
        { Public declarations }
        property ViewModel: IInvoiceViewModelInterface read fViewModel write
            SetViewModel;
    end;

var
    InvoiceForm: TInvoiceForm;

implementation

{$R *.fmx}

{ TInvoiceForm }

procedure TInvoiceForm.SetupGUI;
begin
    LabelTitle.Text := fViewModel.TitleText;
    PopupBoxCustomer.Clear;
    PopupBoxItems.Clear;
    StringGridItems.RowCount := 0;
    EditQuantity.Text := '1';
end;

procedure TInvoiceForm.SetViewModel(
    const newViewModel: IInvoiceViewModelInterface);
begin
    fViewModel := newViewModel;
    if not Assigned(fViewModel) then
        raise Exception.Create('Sales Invoice View Model is required');

    UpdateLabels;
    SetupGUI;
    UpdateGroups;
    UpdatePrintingStatus;
end;

procedure TInvoiceForm.UpdateGroups;
begin
    GroupBoxInvoiceItems.Enabled := fViewModel.GroupBoxInvoiceItemsEnabled;
    GroupBoxBalance.Enabled := fViewModel.GroupBoxBalanceEnabled;
    ButtonPrintInvoice.Enabled := fViewModel.ButtonPrintInvoiceEnabled;
end;

procedure TInvoiceForm.UpdateLabels;
begin
    with ScrollBox1 do
    begin
        LabelTitle.Text := fViewModel.LabelsText.Title;

        GroupBoxCustomerDetails.Text :=
            fViewModel.LabelsText.CustomerDetailsGroupText;
        LabelCustomer.Text := fViewModel.LabelsText.CustomerText;
        LabelDiscountRate.Text :=
            fViewModel.LabelsText.CustomerDiscountRateText;
        LabelOutstandingBalance.Text :=
            fViewModel.LabelsText.CustomerOutstandingBalanceText;

        GroupBoxInvoiceItems.Text :=
            fViewModel.LabelsText.InvoiceItemsGroupText;
        LabelItem.Text := fViewModel.LabelsText.InvoiceItemsText;
        LabelQuantity.Text := fViewModel.LabelsText.InvoiceItemsQuantityText;
        ButtonAddItem.Text :=
            fViewModel.LabelsText.InvoiceItemsAddItemButtonText;
        StringColumn1.Header := fViewModel.LabelsText.InvoiceItemsGridItemText;
        StringColumn2.Header :=
            fViewModel.LabelsText.InvoiceItemsGridQuantityText;
        StringColumn3.Header :=
            fViewModel.LabelsText.InvoiceItemsGridUnitPriceText;
        StringColumn4.Header :=
            fViewModel.LabelsText.InvoiceItemsGridAmountText;

        GroupBoxBalance.Text := fViewModel.LabelsText.BalanceGroupText;
        LabelInvBalance.Text := fViewModel.LabelsText.BalanceInvoiceBalanceText;
        CheckBoxDiscount.Text := fViewModel.LabelsText.BalanceDiscountText;
        LabelTotal.Text := fViewModel.LabelsText.BalanceTotalText;

        ButtonPrintInvoice.Text := fViewModel.LabelsText.PrintInvoiceButtonText;
        LabelPrinting.Text := fViewModel.LabelsText.PrintingText;
        ButtonCancel.Text := fViewModel.LabelsText.CancelButtonText;
    end;
end;

procedure TInvoiceForm.UpdatePrintingStatus;
begin
    AniIndicatorProgress.Visible := fViewModel.AniIndicatorProgressVisible;
    LabelPrinting.Visible := fViewModel.LabelPrintingVisible;
end;

end.

