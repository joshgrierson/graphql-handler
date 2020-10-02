import "package:graphql_parser/graphql_parser.dart";

void main() {
    final String graphqlString = '''
    {
        user {
            me
        }
    }
    ''';
    final stopwatch = new Stopwatch();

    stopwatch.start();

    final tokens = scan(graphqlString);
    final parser = new Parser(tokens);
    final doc = parser.parseDocument();

    final OperationDefinitionContext operation = doc.definitions.first;
    final field = operation.selectionSet.selections.first.field;

    stopwatch.stop();

    print("Parse time: ${stopwatch.elapsedMilliseconds}ms");
    print(field.fieldName.name);
}
