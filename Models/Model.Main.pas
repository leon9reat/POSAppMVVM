unit Model.Main;

interface

uses
    Database, Declarations, Model.Interfaces;

function CreateMainModelClass: IMainModelInterface;

implementation

uses System.SysUtils;

type
    TMainModel = class(TInterfacedObject, IMainModelInterface)
    private
        fMainFormLabelsText: TMainFormLabelsText;
        fDatabase: IDatabaseInterface;
    public
        function getMainFormLabelsText: TMainFormLabelsText;
        function getTotalSales: Currency;
        constructor Create;
    end;

function CreateMainModelClass: IMainModelInterface;
begin
    Result := TMainModel.Create;
end;

{ TMainModel }

constructor TMainModel.Create;
begin
    fDatabase := CreateDatabaseClass;
end;

function TMainModel.getMainFormLabelsText: TMainFormLabelsText;
begin
    fMainFormLabelsText.Title := 'Main Screen';
    fMainFormLabelsText.IssueButtonCaption := 'Issue Invoice';
    fMainFormLabelsText.TotalSalesText := 'Total Sales: ';

    Result := fMainFormLabelsText;
end;

function TMainModel.getTotalSales: Currency;
begin
    Result := fDatabase.getTotalSales;
end;

end.

