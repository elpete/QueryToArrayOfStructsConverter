component implements="coldbox.system.aop.MethodInterceptor" {

    /**
     * @hint Invoke an AOP method invocation
     * @invocation.hint The method invocation object: coldbox.system.aop.MethodInvocation
     */
    public any function invokeMethod(required any invocation) output=false {
        var q = arguments.invocation.proceed();

        return queryToArrayOfStructs(q);
    }

    private array function queryToArrayOfStructs(required any q) {
        var results = [];
        for (var row in arguments.q) {
            results.append(row);
        }
        return results;
    }

}
