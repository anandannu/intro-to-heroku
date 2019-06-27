public with sharing class ContactListController {
	@AuraEnabled
    public static List<contact> contactMethod() {
        List<contact> con = [select id, FirstName, LastName, Email from contact];
        return con;
    }
}