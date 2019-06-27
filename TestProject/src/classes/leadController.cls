public with sharing class leadController {
	@AuraEnabled
    
    public static Lead leadMethod(Lead leadterm) {
        upsert leadterm;
        return leadterm;
    }
}