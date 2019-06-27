({
	doInit : function(component, event, helper) {
        var domain = 'https://'+component.get('v.baseDomain');
        window.addEventListener("message", function(event){
            if(event.origin !== domain){
                return;
            }
            console.log(event.data);
            component.set("v.received",event.data);
        } ,false);
	}
})