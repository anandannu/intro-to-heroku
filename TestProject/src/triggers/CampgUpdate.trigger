trigger CampgUpdate on CampaignMember (before insert) {
	Set<Id> cmId = new Set<Id>();
    for(CampaignMember cm:Trigger.New) {
        if(cm.Priority__c == 'High'){
            cmId.add(cm.Id);
        }
    }
    
}