({
	doInit : function(component, event, helper) {
		component.find("leadId").getNewRecord(
        "Lead",
        null,
        false,
            $A.getCallback(function() {
                var rec = component.get("v.recordLead");
                var error = component.get("v.recordError");
                if(error || (rec === null)) {
                   console.log('Error'+error); 
                    return;
                }
            })
        )
	}
})