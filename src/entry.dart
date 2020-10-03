import 'package:graphql_parser/graphql_parser.dart';

import 'event_bus.dart';
import 'handlers/handler.dart';

class Entry {
    EventBus _eventBus;

    Map<String, Handler> _handlers;

    Entry(EventBus eventBus) {
        this._eventBus = eventBus;
        this._handlers = {};
    }

    void registerHandler(Handler handler) {
        this._handlers[handler.TAG.toLowerCase()] = handler;
    }

    void execute(String graphqlInput) {
        if (this._handlers.length == 0) {
            throw "No handlers registered";
        }

        final tokens = scan(graphqlInput);
        final document = new Parser(tokens).parseDocument();

        final List definitions = document.definitions;

        definitions.forEach((definition) {
            definition.selectionSet.selections.forEach((selection) {
                final field = selection.field.fieldName;
                final name = field.name;

                if (this._handlers.containsKey(name)) {
                    this._handlers[name].run();
                } else {
                    this._noHandler(name);
                }
            });
        });
    }

    void _noHandler(String queryName) {
        this._eventBus.emit(event: "no-handler", data: queryName);
    }
}