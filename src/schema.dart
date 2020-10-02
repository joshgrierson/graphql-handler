import 'package:graphql_schema/graphql_schema.dart';

class Schema {
    GraphQLSchema _graphQLSchema;

    Schema() {
        this._graphQLSchema = new GraphQLSchema();
    }
}