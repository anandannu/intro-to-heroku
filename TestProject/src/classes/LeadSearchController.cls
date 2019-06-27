public with sharing class LeadSearchController {
	@AuraEnabled
    public static List<Lead> leadSearchMethod(String searchTerm) {
        List<Lead> led = database.query('Select id,Name,Email from Lead Where Name like \'%'+ searchTerm+ '%\' ');
        Return led;
    }
}