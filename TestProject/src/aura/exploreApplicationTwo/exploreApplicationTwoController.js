({
	handlerset : function(component, event, helper) {
		var msg = event.getParams();
        
        component.set("v.message",msg.messageApp);
	}
})