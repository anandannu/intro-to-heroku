({
	doInit : function(component, event, helper) {
		var action = component.get("c.contactMethod");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                console.log(response.getReturnValue());
            }else{
                console.log("failured"+ state);
            }
           component.set('v.ContactList',response.getReturnValue()); 
        })
        $A.enqueueAction(action);
	},
})