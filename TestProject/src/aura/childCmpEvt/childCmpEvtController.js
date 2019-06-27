({
	callHandler : function(component, event, helper) {
		var cmp = component.getEvent("findOutEvent");
         cmp.setParams({
             "messageEvt" : "this is child dynamic..."
        });
        cmp.fire();
	}
})