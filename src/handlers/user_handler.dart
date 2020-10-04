import 'package:graphql_parser/graphql_parser.dart';
import 'package:graphql_schema/graphql_schema.dart';

import 'handler.dart';

class UserHandler extends Handler {
    String TAG = "User";

    GraphQLSchema _schema;

    List<FieldContext> _fields = [];

    UserHandler() {
        this._schema = new GraphQLSchema(
            queryType: objectType("user", fields: [
                field("me", graphQLString.nonNullable())
            ])
        );
    }

    void registerSelections(List<SelectionContext> selections) {
        selections.forEach((selection) {
            this._fields.add(selection.field);
        });
    }

    void run() {
        print("Running handler.");

        final ValidationResult validation = this._schema.queryType.validate("@user", {
            "me": "",
        });

        if (!validation.successful) {
            print(validation.errors.length);
            validation.errors.forEach((error) {
                print(error);
            });
        }
    }
}