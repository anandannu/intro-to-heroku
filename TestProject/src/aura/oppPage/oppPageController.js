({
	ShowContact : function(component, event, helper) {
        var action = component.get("c.getAllContact");
        var RecId = component.get("v.recordId");
        action.setParams({
            OppId : RecId
        });
        action.setCallback(this, function(response){
            var similercases1 = response.getReturnValue();
            component.set("v.contacts",similercases1);
            console.log('similercases1'+similercases1)
        });
        $A.enqueueAction(action);
	},
     handleSelectAllContact: function(component, event, helper) {
        var getID = component.get("v.contactList");
        var checkvalue = component.find("selectAll").get("v.value");        
        var checkContact = component.find("checkContact"); 
        if(checkvalue == true){
            for(var i=0; i<checkContact.length; i++){
                checkContact[i].set("v.value",true);
            }
        }
        else{ 
            for(var i=0; i<checkContact.length; i++){
                checkContact[i].set("v.value",false);
            }
        }
    },
     
    //Process the selected contacts
    handleSelectedContacts: function(component, event, helper) {
        var selectedContacts = [];
        var checkvalue = component.find("checkContact");
         
        if(!Array.isArray(checkvalue)){
            if (checkvalue.get("v.value") == true) {
                selectedContacts.push(checkvalue.get("v.text"));
            }
        }else{
            for (var i = 0; i < checkvalue.length; i++) {
                if (checkvalue[i].get("v.value") == true) {
                    selectedContacts.push(checkvalue[i].get("v.text"));
                }
            }
        }
        
       
    },
    
    UpdateRole: function(component, event, helper) {
        var RoleIdsList = [];
         var RoleIds = component.find("conRole").get("v.value");
        var RecId = component.get("v.recordId");
        alert(RoleIds);
        console.log(RoleIds);
        for (var i = 0; i < RoleIds.length; i++) {
                if (RoleIds[i].get("v.value")) {
                    RoleIdsList.push(RoleIds[i].get("v.text"));
                }
             alert(RoleIds);
        console.log(RoleIds);
            }
        
        
    },
    textChange: function(cmp, event,helper) {  
            var target = event.getSource();  
            var txtVal = target.get("v.value") ;
            alert(txtVal);
            console.log('Selected Value is '+txtVal);  
    }
    
})