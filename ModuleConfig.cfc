component {

	this.title         = 'QueryToArrayOfStructsConverter';
	this.author        = 'Eric Peterson';
	this.webURL        = 'https://github.com/elpete/QueryToArrayOfStructsConverter';
	this.description   = 'ColdBox/WireBox Aspect to convert queries to arrays of structs';
	this.version       = '1.0.0';
	this.autoMapModels = false;

	function configure() {

        addAOPListenerIfNeeded();

        binder.mapAspect('QueryToArrayOfStructsConverter')
              .to('#moduleMapping#.aspects.QueryToArrayOfStructsConverter');

        // // Bind by component annotation
        binder.bindAspect(
            classes = binder.match().annotatedWith('convertToArrayOfStructs'),
            methods = binder.match().any(),
            aspects = 'QueryToArrayOfStructsConverter'
        );

        // // Bind by method annotation
        binder.bindAspect(
            classes = binder.match().any(),
            methods = binder.match().annotatedWith('convertToArrayOfStructs'),
            aspects = 'QueryToArrayOfStructsConverter'
        );

	}

    private function addAOPListenerIfNeeded() {

        if (AOPListenerIsRegistered()) {
            return;
        }

        binder.listener(class = 'coldbox.system.aop.Mixer');
        wirebox.configure(binder, {});
    }

    private function AOPListenerIsRegistered() {
        var listeners = binder.getListeners();

        // I'm using a for loop for cross-platform compatibility
        var registered = false;
        for (var listener in listeners) {
            if (listener.class == 'coldbox.system.aop.Mixer') {
                registered = true;
            }
        }

        return registered;
    }

}
