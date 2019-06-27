({
	doShow : function(component, event, helper) {
        var modalId = component.find("dialogShow");
		$A.util.addClass(modalId ,'slds-fade-in-open');
        var modalId2 = component.find("bgShow");
		$A.util.addClass(modalId2 ,'slds-backdrop_open');
	}
})