({
    ShowContact : function(component, event, helper) {
        var action = component.get("c.getContactList");
        
        action.setParams({
            "oppId" : component.get("v.recordId")
        });
        
        action.setCallback(this, function(response){
            var similercases1 = response.getReturnValue();
            console.log('similercases1'+similercases1)
            component.set("v.conList",similercases1);
        });
        $A.enqueueAction(action);
    },
    
    selectedRecordId: function(component, event, helper) {
        
        var OppSelectedRecordID = [];
        
        var getAllId = component.find("boxPack");
        // If the local ID is unique[in single record case], find() returns the component. not array
        if(! Array.isArray(getAllId)){
            if (getAllId.get("v.value") == true) {
                OppSelectedRecordID.push(getAllId.get("v.text"));
            }
        }else{
            
            for (var i = 0; i < getAllId.length; i++) {
                if (getAllId[i].get("v.value") == true) {
                    OppSelectedRecordID.push(getAllId[i].get("v.text"));
                }
            }
        } 
        var opportunityId = component.get("v.recordId");
        var roleVar = component.get("v.conRole");
        
        helper.selectedRecordIdHelper(component, event, OppSelectedRecordID, opportunityId,roleVar);
        
    }
})