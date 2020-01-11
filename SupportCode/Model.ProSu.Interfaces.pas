unit Model.ProSu.Interfaces;

interface

uses
    Model.ProSu.InterfaceActions;

type
    INotificationClass = interface['{81BFF4B4-2035-4E4E-B1BB-2331E3339361}']
    end;

    TUpdateSubscriberMethod = procedure (const notifyClass: INotificationClass) of object;

    ISubscriberInterface = interface['{2BA39097-CD0A-4A68-9D1C-E48810EF42B2}']
        procedure updateSubscriber(const notifClass: INotificationClass);
        procedure setUpdateSubscriberMethod(newMethod: TUpdateSubscriberMethod);
    end;

    IProviderInterface = interface['{5A2E166D-55C5-4152-B72B-53DFD84AB2D1}']
        procedure subscribe(const tmpSubscriber: ISubscriberInterface);
        procedure unsubscribe(const tmpSubscriber: ISubscriberInterface);
        procedure notifySubscribers(const notifyClass: INotificationClass);
    end;

implementation

end.
