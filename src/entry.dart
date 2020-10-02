import 'event_bus.dart';

class Entry {
    EventBus _eventBus;

    Entry(EventBus eventBus) {
        this._eventBus = eventBus;
    }

    void execute(String graphqlInput) {}
}