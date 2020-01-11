program POSAppMVVM;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.MainForm in 'Views\View.MainForm.pas' {MainForm},
  Model.Main in 'Models\Model.Main.pas',
  Database in 'Models\Database.pas',
  Declarations in 'Models\Declarations.pas',
  ViewModel.Main in 'ViewModels\ViewModel.Main.pas',
  Model.ProSu.Interfaces in 'SupportCode\Model.ProSu.Interfaces.pas',
  Model.ProSu.Provider in 'SupportCode\Model.ProSu.Provider.pas',
  Model.ProSu.Subscriber in 'SupportCode\Model.ProSu.Subscriber.pas',
  View.TestPrintInvoice in 'Views\View.TestPrintInvoice.pas' {TestPrintInvoiceForm},
  Model.ProSu.InterfaceActions in 'SupportCode\Model.ProSu.InterfaceActions.pas',
  Model.Interfaces in 'Models\Model.Interfaces.pas',
  View.InvoiceForm in 'Views\View.InvoiceForm.pas' {InvoiceForm},
  Model.Invoice in 'Models\Model.Invoice.pas',
  ViewModel.Invoice in 'ViewModels\ViewModel.Invoice.pas';

{$R *.res}

var
    mainModel: IMainModelInterface;
    mainViewModel: IMainViewModelInterface;
begin
    mainModel := createMainModelClass;
    mainViewModel := CreateMainViewModelClass;
    mainViewModel.Model := mainModel;

    Application.Initialize;

    MainForm := TMainForm.Create(Application);
    MainForm.ViewModel := mainViewModel;

    Application.MainForm := MainForm;
    MainForm.Show;

    Application.CreateForm(TTestPrintInvoiceForm, TestPrintInvoiceForm);
  Application.Run;
end.

