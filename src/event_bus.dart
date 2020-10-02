class EventBus {
    Map<String, Function> _subscribers;

    EventBus() {
        this._subscribers = {};
    }

    void on(String event, Function invokable) {}

    void emit(String event, dynamic data) {}
}