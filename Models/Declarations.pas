unit Declarations;

interface

uses
    Model.ProSu.InterfaceActions, Model.ProSu.Interfaces;

type
    // customer
    TCustomer = class
    private
        fID: Integer;
        fName: string;
        fDiscountRate: Double;
        fBalance: Currency;
    public
        property ID: integer read fID write fID;
        property Name: string read fName write fName;
        property DiscountRate: Double read fDiscountRate write fDiscountRate;
        property Balance: Currency read fBalance write fBalance;
    end;

    // item
    TItem = class
    private
        fID: Integer;
        fDescription: string;
        fPrice: Currency;
    public
        property ID: Integer read fID write fID;
        property Description: string read fDescription write fDescription;
        property Price: Currency read fPrice write fPrice;
    end;

    // invoce
    TInvoice = class
    private
        fID: integer;
        fNumber: integer;
        fCustomerID: integer;
    public
        property ID: Integer read fID write fID;
        property Number: Integer read fNumber write fNumber;
        property CustomerID: Integer read fCustomerID write fCustomerID;
    end;

    // invoice item
    TInvoiceItem = class
    private
        fID: Integer;
        fInvoiceID: Integer;
        fItemID: Integer;
        fUnitPrice: Currency;
        fQuantity: Integer;
    public
        property ID: Integer read FID write fID;
        property InvoiceID: Integer read fInvoiceID write fInvoiceID;
        property ItemID: Integer read fItemID write fItemID;
        property UnitPrice: Currency read fUnitPrice write fUnitPrice;
        property Quantity: Integer read fQuantity write fQuantity;
    end;

    // this record keeps the text of the visual component
    TMainFormLabelsText = record
        Title,
            IssueButtonCaption,
            TotalSalesText: string;
    end;

    TNotificationClass = class(TInterfacedObject, INotificationClass)
        private
            fAction: TInterfaceActions;
            fActionValue: Double;
        public
            property actions: TInterfaceActions read fAction write fAction;
            property ActionValue: Double read fActionValue write fActionValue;
    end;

implementation

{ TInvoiceItem }

end.

