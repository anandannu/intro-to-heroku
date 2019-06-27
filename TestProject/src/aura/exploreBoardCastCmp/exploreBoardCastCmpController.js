({
	handlerData : function(component, event, helper) {
        var appEvt = $A.get("e.force:myDatatransfer");
        appEvt.setparams({
            'message':'hey!!!! salesforce casts'
        });
        appEvt.fire();
	}
})