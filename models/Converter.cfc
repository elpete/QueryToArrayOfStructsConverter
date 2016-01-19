component name="Converter" {

    public array function queryToArrayOfStructs(required any q) {
        var results = [];
        for (var row in arguments.q) {
            results.append(row);
        }
        return results;
    }

}
