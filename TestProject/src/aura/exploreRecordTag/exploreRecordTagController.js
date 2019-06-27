({
	HandlerSave : function(component, event, helper) {
        component.find('record').saveRecord($A.getCallback(function(saveResult){
            if(saveResult.state === 'SUCCESS' || saveResult.state === 'DRAFT') {
                console.log('record save successfully');
                var toastResult = $A.get("e.force:showToast");
                toastResult.setParams({
                    'title' :'record',
                    'message':'record save successfully'
                })
                toastResult.fire();
                
            } else if(saveResult.state === 'INCOMPLETE') {
                console.log('incomplete record');
            }else if(saveResult.state === 'ERROR') {
                console.log('Error');
            }else {
                console.log('Unknown error'+saveResult.state);
            }
        }));
	}
})