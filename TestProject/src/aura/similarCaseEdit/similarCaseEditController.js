({
	getCaseRecord : function(component, event, helper) {
		var tempRec = component.find('editcaserecord');
        tempRec.set('v.recordId',component.get('v.remoteId'));
        tempRec.reloadRecord();
	},
    toggleDialoge : function(component, event, helper) {
        var modalId = component.find("dialogShow");
		$A.util.toggleClass(modalId ,'slds-fade-in-open');
        var modalId2 = component.find("bgShow");
		$A.util.toggleClass(modalId2 ,'slds-backdrop_open');
        component.set("v.showDialoge", false);
    },
    saveRecord : function (component, event, helper) {
        var newCasePhone = component.find("newSuppliedName").get("v.value");
        var newCaseEmail = component.find("newSuppliedPhone").get("v.value");
        var newCaseName = component.find("newSuppliedEmail").get("v.value");
        
        component.set("v.selectedCase.fields.SuppliedPhone.value",newCasePhone);
        component.set("v.selectedCase.fields.SuppliedEmail.value",newCaseEmail);
        component.set("v.selectedCase.fields.SuppliedName.value",newCaseName);
        
        var tempRec = component.find('editcaserecord');
        tempRec.saveRecord($A.getCallback(function(response){
            if(response.state === 'SUCCESS'||response.state === 'DRAFT') {
               console.log('record save Successfully'); 
            }else if (response.state === 'ERROR') {
               console.log('ERROR'+response.state); 
            } else {
               console.log('Something Wrong'+response.state); 
            }
        }));
        
        var modalId = component.find("dialogShow");
		$A.util.toggleClass(modalId ,'slds-fade-in-open');
        var modalId2 = component.find("bgShow");
		$A.util.toggleClass(modalId2 ,'slds-backdrop_open');
        component.set("v.showDialoge", false);
    }
})