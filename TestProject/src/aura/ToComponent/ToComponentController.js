({
	doInit : function(component, event, helper) {
		var pr = component.get("v.pageReference.state.message");
        console.log('test'+pr);
        component.set("v.message",pr);
	}
})