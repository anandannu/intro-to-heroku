public with sharing class getAllObject {
    
    public static void check(String sObjectName){
       String sObjectFields = MyUtils.fetchFieldNames(sObjectName); 
       String query ='SELECT ' + sObjectFields + ' FROM ' + sObjectName;
       List<sObject> listOfSObject =  Database.query(query);
       System.debug('All Reocrds '+ listOfSObject); 
    }
}