public with sharing class similarCaseshandler {
	@AuraEnabled
    
    public static List<Case> getCasesMethod(String status) {
        return [Select id,CaseNumber,Status,Priority,Origin from case where Status =: status];
    } 
}