unit Model.ProSu.Subscriber;

interface

uses
    Model.ProSu.Interfaces;

type
    TProSuSubscriber = class(TInterfacedObject, ISubscriberInterface)
    private
        fUpdateMethod: TUpdateSubscriberMethod;
    public
        procedure updateSubscriber(const notifyClass: INotificationClass);
        procedure setUpdateSubscriberMethod(newMethod: TUpdateSubscriberMethod);
    end;

implementation

{ TProSuSubscriber }

procedure TProSuSubscriber.setUpdateSubscriberMethod(
    newMethod: TUpdateSubscriberMethod);
begin
    fUpdateMethod := newMethod;
end;

procedure TProSuSubscriber.updateSubscriber(
    const notifyClass: INotificationClass);
begin
    if Assigned(fUpdateMethod) then
        fUpdateMethod(notifyClass);
end;

end.

