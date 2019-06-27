({
	goToRec : function(component, event, helper) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId":component.get("v.caseId")
        });
        navEvt.fire();
	},
    editRecord : function(component, evevnt, helper) {
        var recId = component.get("v.caseId"); 
        component.set("v.remoteId", recId);
        component.set("v.showDialoge", "true");
    },
})