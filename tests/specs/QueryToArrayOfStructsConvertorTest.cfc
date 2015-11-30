component extends="testbox.system.BaseSpec" {

    function run() {

        describe("it correctly converts queries to arrays of structs", function() {

            it("can convert empty queries to empty arrays", function() {

                var converter = getMockBox().createMock("root.aspects.QueryToArrayOfStructsConverter");

                var emptyQuery = QueryNew("id,name", "cf_sql_integer,cf_sql_varchar", []);

                makePublic(converter, "queryToArrayOfStructs", "publicQueryToArrayOfStructs");
                var results = converter.publicQueryToArrayOfStructs(emptyQuery);

                expect(results).toBeArray();
                expect(results).toBeEmpty();

            });

        });

    }

}
