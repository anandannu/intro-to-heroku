({
	searchLeads : function(component, event, helper) {
		var action = component.get("c.leadSearchMethod");
        action.setParams({
            searchTerm : component.get("v.contact")
        })
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                console.log('success'+response.getReturnValue());
            }else{
                console.log('failure');
            }
            component.set("v.ContactList",response.getReturnValue());
        })
        $A.enqueueAction(action);
	}
})