unit Model.ProSu.Provider;

interface

uses
    Model.ProSu.Interfaces, System.Generics.Collections;

type
    TProSuProvider = class(TInterfacedObject, IProviderInterface)
    private
        fSubscriberList: TList<ISubscriberInterface>;
    public
        procedure subscribe(const tmpSubscriber: ISubscriberInterface);
        procedure unsubscribe(const tmpSubscriber: ISubscriberInterface);
        procedure notifySubscribers(const notifyClass: INotificationClass);

        constructor Create;
        destructor Destroy; override;
    end;

implementation

{ TProSuProvider }

constructor TProSuProvider.Create;
begin
    inherited;
    fSubscriberList := TList<ISubscriberInterface>.Create;
end;

destructor TProSuProvider.Destroy;
var
    iTemp: ISubscriberInterface;
begin
    for iTemp in fSubscriberList do
        unsubscribe(iTemp);
    fSubscriberList.Free;
    inherited;
end;

procedure TProSuProvider.notifySubscribers(
    const notifyClass: INotificationClass);
var
    tmpSubscriber: ISubscriberInterface;
begin
    for tmpSubscriber in fSubscriberList do
        tmpSubscriber.updateSubscriber(notifyClass);
end;

procedure TProSuProvider.subscribe(const tmpSubscriber: ISubscriberInterface);
begin
    fSubscriberList.Add(tmpSubscriber);
end;

procedure TProSuProvider.unsubscribe(const tmpSubscriber: ISubscriberInterface);
begin
    fSubscriberList.Remove(tmpSubscriber);
end;

end.

