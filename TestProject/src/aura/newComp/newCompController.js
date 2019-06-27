({
	doInit : function(component, event, helper) {
		component.find('record').getNewRecord(
        		"Contact",
            	null,
            	false,
                $A.getCallback(function(saveResult){
                	var rec = component.get("v.targetRec");
                    var error = component.get("v.Error");
                    if(error || rec === null) {
                        console.log('Error in this');
                    }else {
                        console.log('Something different');
                    }
                }));
	},
    HandlerSave : function(component,event,helper) {
        component.set("v.simpleRec.AccountId", component.get("v.recordId"));
        component.find("record").saveRecord($A.getCallback(function(saveResult){
            
            if(saveResult.state === 'SUCCESS' || saveResult.state === 'DRAFT') {
               
                var toast = $A.get("e.force:showToast");
                toast.setParams({
                    'title':'saved',
                    'message':'record save successfully'
                });
                toast.fire();
            
                console.log('record save Successfully');
            }else if( saveResult === 'INCOMPLETE') {
                console.log('record save incomplete');
            }else if(saveResult.state === 'ERROR') {
                console.log('record save ERROR'+JSON.stringify(saveResult.error));
            } else {
                console.log('something  gfdxhfdzxhfz');
            }
        }));
    }
})