({
	MyLead : function(component, event, helper) {
		 
        var action = component.get("c.LeadTest");       
         action.setCallback(this, function(Result){
            component.set("v.LeadData",Result.getReturnValue());
            console.log( JSON.stringify(Result.getReturnValue())+'Test');
        });       
        $A.enqueueAction(action);
      },
    MyUser : function(component, event, helper) {
        
        var action = component.get("c.fetchUser");
        action.setCallback(this, function(Result){
             component.set("v.UserData",Result.getReturnValue());     
            console.log( JSON.stringify(Result.getReturnValue())+'Test');
                           });
         $A.enqueueAction(action);
    }
    
})