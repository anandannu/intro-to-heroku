({
	oneHandler : function(component, event, helper) {
        var appEvent = $A.get("e.c:exploreApplicationEvt"); 
        appEvent.setParams({
            "messageApp":"this is a message from component first"
        });
        appEvent.fire();
	}
})