import 'package:graphql_parser/graphql_parser.dart';

abstract class Handler {
    String TAG;

    void registerSelections(List<SelectionContext> fields);

    void run();
}