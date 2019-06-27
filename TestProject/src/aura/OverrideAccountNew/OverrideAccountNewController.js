({
	doInit : function(component, event, helper) {
        var steptwo = component.find("StepTwo");
        $A.util.toggleClass(steptwo,'slds-hide');
        var stepthree = component.find("StepThree");
        $A.util.toggleClass(stepthree,'slds-hide');
        component.set("v.progress","Step1");
        
		component.find("AccountId").getNewRecord(
         "Account",
            null,
            false,
            $A.getCallback(function(){
               var rec = component.get("v.NewAccountRec");
               var error = component.get("v.Error");
                if(error || (rec === null)){
                   console.log('this is fail'); 
                }
                else {
                    console.log('this is success'); 
                }
            })
        );
	},
    StepOne : function(component, event, helper) {
        var stepone = component.find("StepOne");
        $A.util.toggleClass(stepone,'slds-hide');
        var steptwo = component.find("StepTwo");
        $A.util.toggleClass(steptwo,'slds-hide');
        component.set("v.progress","Step2");
    },
    StepTwo : function(component, event, helper) {
        var stepthree = component.find("StepThree");
        $A.util.toggleClass(stepthree,'slds-hide');
        var steptwo = component.find("StepTwo");
        $A.util.toggleClass(steptwo,'slds-hide');
        component.set("v.progress","Step3");
    },
    SaveRecord:function(component, event, helper) {
        component.find("AccountId").saveRecord(function(saveResult){
            if(saveResult.state === 'SUCCESS' || saveResult.state ==='DRAFT') {
                console.log('successfully save');
                var toast = $A.get('e.force:showToast');
                toast.setParams({
                    'message':'record save successfully',
                    'title' :'save'
                });
                toast.fire();
                
                var result = $A.get('e.force:navigateToSObject');
                result.setParams({
                    'recordId':saveResult.recordId
                });
                result.fire();
                
            }else if(saveResult.state === 'INCOMPLETE') {
                console.log('process is incompleted');
            } else if(saveResult.state === 'Error') {
                console.log('Error in this..!');
            }
        });
    }
    
})