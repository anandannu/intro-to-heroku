({
	createLead : function(component, event, helper) {
		var lead = component.get("v.leadform");
        console.log('lead');
        var action = component.get("c.leadMethod");
        
        action.setParams({
            "leadterm":lead
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                console.log('Success');
            }else {
                console.log('failure'+response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})