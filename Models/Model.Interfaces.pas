unit Model.Interfaces;

interface

uses
    Declarations, System.Generics.Collections;

type
    IDatabaseInterface = interface
        ['{70CB148C-1E78-47DA-B91C-6FDF598F098D}']
        function getCustomerList: TObjectList<TCustomer>;
        function getCustomerFromName(const nameStr: string): TCustomer;
        function getItems: TObjectList<TItem>;
        function getItemFromDescription(const desc: string): TItem;
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
        function getTotalSalesValue: string;
        property Model: IMainModelInterface read getModel write setModel;
        property LabelsText: TMainFormLabelsText read getLabelsText;
    end;

    IInvoiceModelInterface = interface
        ['{2FADD0EB-2A95-4DA4-8A54-61E9A4CBF2F8}']
        function GetInvoiceFormLabelsText: TInvoiceFormLabelsText;
        procedure SetInvoice(const newInvoice: TInvoice);
        procedure GetInvoice(var invoice: TInvoice);
        procedure GetCustomerList(var customers: TObjectList<TCustomer>);
        procedure GetItems(var items: TObjectList<TItem>);
    end;

    IInvoiceViewModelInterface = interface
        ['{CAAF4907-D369-4799-9816-42A34ABC8524}']
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

        property Model: IInvoiceModelInterface read GetModel write SetModel;
        property LabelsText: TInvoiceFormLabelsText read GetLabelsText;
        property TitleText: string read GetTitleText;
        property GroupBoxInvoiceItemsEnabled: Boolean read
            GetGroupBoxInvoiceItemsEnabled;
        property GroupBoxBalanceEnabled: Boolean read GetGroupBoxBalanceEnabled;
        property ButtonPrintInvoiceEnabled: Boolean read
            GetButtonPrintInvoiceEnabled;
        property AniIndicatorProgressVisible: Boolean read
            GetAniIndicatorProgressVisible;
        property LabelPrintingVisible: Boolean read GetLabelPrintingVisible;
    end;

implementation

end.

