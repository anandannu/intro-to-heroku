({
	sendDataToVf : function(component, event, helper) {
		var mes = component.get('v.message');
        var vfDomain = "https://"+component.get('v.baseDomain');
        var vfWindow = component.find('toVfPage').getElement().contentWindow;
        vfWindow.postMessage(mes,vfDomain);
        }
})