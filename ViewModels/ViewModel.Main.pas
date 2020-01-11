unit ViewModel.Main;

interface

uses
    Declarations, Model.Main, Model.Interfaces;

function CreateMainViewModelClass: IMainViewModelInterface;

implementation

uses
    System.SysUtils;

type
    TMainViewModel = class(TInterfacedObject, IMainViewModelInterface)
    private
        fModel: IMainModelInterface;
        fLabelText: TMainFormLabelsText;
        fTotalSalesValue: Currency;
        function getModel: IMainModelInterface;
        procedure setModel(const newModel: IMainModelInterface);
        function getLabelsText: TMainFormLabelsText;
    public
        property Model: IMainModelInterface read fModel write setModel;
        property LabelsText: TMainFormLabelsText read getLabelsText;
        function getTotalSalesValue: string;
    end;

function CreateMainViewModelClass: IMainViewModelInterface;
begin
    Result := TMainViewModel.Create;
end;

{ TMainViewModel }

function TMainViewModel.getLabelsText: TMainFormLabelsText;
begin
    fLabelText := fModel.getMainFormLabelsText;
    Result := fLabelText;
end;

function TMainViewModel.getModel: IMainModelInterface;
begin
    Result := fModel;
end;

function TMainViewModel.getTotalSalesValue: string;
begin
    fTotalSalesValue := fModel.getTotalSales;
    Result := Format('%10.2f', [fTotalSalesValue]);
end;

procedure TMainViewModel.setModel(const newModel: IMainModelInterface);
begin
    fModel := newModel;
end;

end.

