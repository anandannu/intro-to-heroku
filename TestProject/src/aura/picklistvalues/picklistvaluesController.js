({
	doInit : function(component, event, helper) {
		var action = component.get("c.getListValueIntoList");
        system.debug('this is js');
        action.setParams({
            sobjectget: component.get("v.sObjectName"),
            selectedfields: component.get("v.sObjectFields")
        });
        action.setCallback(this,function(result){
            var List = result.getReturnValue();
            component.set("v.picklistValues",List);
        });
        $A.enqueueAction(action);
	},
})