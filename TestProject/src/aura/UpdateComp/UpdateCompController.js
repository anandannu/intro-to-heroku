({
	recordUpdatedHandler : function(component, event, helper) {
		var evtparams = event.getParams();
        if(evtparams.changeType === 'CHANGED') {
            var changeField = evtparams.changeFields;
        } else if(evtparams.changeType === 'LOADED') {
            
        } else if (evtparams.changeType === 'REMOVED') {
            
        } else if (evtparams.changeType === 'ERROR') {
            
        }
	}
})