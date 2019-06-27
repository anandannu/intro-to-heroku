({
	deleteHandler : function(component, event, helper) {
        component.find('deleteId').deleteRecord($A.getCallback(function(delResult){
            
            if(delResult.state === 'SUCCESS' || delResult.state === 'DRAFT') {
                console.log('recored delete successfully');
                
                var toast = $A.get('e.force:showToast');
                toast.setParams({
                    'title':'record delete',
                    'message' : 'delete record successfully',
                    'type':'Error',
                    'mode':'striky'
                    
                });
                toast.fire();
                
                var evtHome = $A.get('e.force:navigateToObjectHome');
                evtHome.setParams({
                    'scope':'Account'
                });
                evtHome.fire();
                
            } else if( delResult.state === 'INCOMPLETE') {
                console.log('INCOMPLETE');
            }else if(delResult.state === 'error') {
                 console.log('ERROR');
            } else {
                console.log('other error');
            }
            
        }));
	}
})