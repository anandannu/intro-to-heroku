({
    selectedRecordIdHelper : function(component, event, conIds, oppId, roleVar) {
        console.log('conIds'+conIds);
        var action = component.get('c.updateConRole');
        // pass the all selected record's Id's to apex method 
        action.setParams({
            "conIdsList": conIds,
            "OppId" : oppId,
            "roleVar" : roleVar
        });
        action.setCallback(this, function(response) {
            //store state of response
            var state = response.getState();
            if (state === "SUCCESS") {
                 // alert('Role Added Successfuly'); 
                 $A.get('e.force:refreshView').fire();            
            }
            else if(state === "ERROR"){
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                }
            }
        });
        $A.enqueueAction(action);
    }

 })