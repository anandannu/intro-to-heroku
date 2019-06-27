({
	OtherComponent : function(component, event, helper) {
		var navicmp = component.find('navigateToOther');
        var pageReference = {
            type : 'standard__component',
            attributes : {
                "componentName" : 'c__ToComponent'
            },
            state : {
                "message" : "Summer 18"
            }
        };
        navicmp.navigate(pageReference);
	}
})