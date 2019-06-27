({
	handler : function(component, event, helper) {
        var updatevalue = event.getParams("messageEvt");
		component.set("v.message", updatevalue.messageEvt);
	}
})