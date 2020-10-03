import 'entry.dart';
import 'event_bus.dart';
import 'handlers/user_handler.dart';

void main() {
    final String graphqlString = '''
    {
        user {
            me
        }
    }
    ''';

    final eventBus = new EventBus();
    final entry = new Entry(eventBus);

    eventBus.on("no-handler", (handlerName) => {
        print("Query handler $handlerName not found")
    });

    entry.registerHandler(new UserHandler());
    entry.execute(graphqlString);
}
