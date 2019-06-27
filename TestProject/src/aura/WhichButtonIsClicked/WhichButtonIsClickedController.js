({
	CallYes : function(component, event, helper) {
        var action = component.get("c.whichButtonIsClickedConMethod");
        action.setCallback(this,function(response){
            var state = response.getState();
            
            if(state === 'SUCCESS'){
                console.log("success");
                console.log(response.getReturnValue());
            }else{
                console.log("Failure"+state);
            }
        });
        $A.enqueueAction(action);
	},
    CallNo : function(component, event, helper) {
		helper.CommonFunction(component, event);
	},    
})