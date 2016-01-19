component implements="coldbox.system.aop.MethodInterceptor" {

    property name="converter" inject="Converter";

    /**
     * @hint Invoke an AOP method invocation
     * @invocation.hint The method invocation object: coldbox.system.aop.MethodInvocation
     */
    public any function invokeMethod(required any invocation) output=false {
        var q = arguments.invocation.proceed();

        return converter.queryToArrayOfStructs(q);
    }

}
