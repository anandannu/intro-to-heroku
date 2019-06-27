({
	doInit : function(component, event, helper) {
        var spinner = component.find("spinner");
        $A.util.removeClass(spinner,"slds-hide");
        
		var action = component.get("c.getCasesMethod");
        action.setParams({
            status:component.get("v.case.fields.Status.value")
        });
        
        action.setCallback(this,function(response){
            var similarcase = response.getReturnValue();
            component.set("v.similarCases",similarcase);
            $A.util.addClass(spinner,"slds-hide");
        });
        $A.enqueueAction(action);
	}
})