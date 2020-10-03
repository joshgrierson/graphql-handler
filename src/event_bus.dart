import "package:meta/meta.dart";

class EventBus {
    Map<String, Function> _subscribers;

    EventBus() {
        this._subscribers = {};
    }

    void on(String event, Function invokable) {
        this._subscribers[event] = invokable;
    }

    void emit({ @required String event, dynamic data }) {
        if (this._subscribers.containsKey(event)) {
            if (data != null) {
                this._subscribers[event](data);
            } else {
                this._subscribers[event]();
            }
        } else {
            print("Event $event has no subscribers");
        }
    }
}