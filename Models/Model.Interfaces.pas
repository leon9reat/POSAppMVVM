unit Model.Interfaces;

interface

uses
    Declarations, System.Generics.Collections;

type
    IDatabaseInterface = interface
        ['{70CB148C-1E78-47DA-B91C-6FDF598F098D}']
        function getCustomerList: TObjectList<TCustomer>;
        function getCustomerFromName(const nameStr: String): TCustomer;
        function getItems: TObjectList<TItem>;
        function getItemFromDescription(const desc: String): TItem;
        function getItemFromID(const id: Integer): TItem;
        function getTotalSales: Currency;
        procedure saveCurrentSales(const currentSales: Currency);
    end;

    IMainModelInterface = interface
        ['{C61B5EFD-A412-4F00-9C39-B9FAD9A0C229}']
        function getMainFormLabelsText: TMainFormLabelsText;
        function getTotalSales: Currency;
    end;

    IMainViewModelInterface = interface
        ['{CD960E85-7D77-4C27-B63C-81C01F08601D}']
        function getModel: IMainModelInterface;
        procedure setModel(const newModel: IMainModelInterface);
        function getLabelsText: TMainFormLabelsText;
        function getTotalSalesValue: String;
        property Model: IMainModelInterface read getModel write setModel;
        property LabelsText: TMainFormLabelsText read getLabelsText;
    end;

implementation

end.
