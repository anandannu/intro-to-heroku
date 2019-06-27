public with sharing class picklistValueController {
	
    @AuraEnabled
    public static List<String> getListValueIntoList(string sobjectget,string selectedfields) {
        List<String> picKlistValueList = new List<String>();
         Schema.SObjectType objectType = Schema.getGlobalDescribe().get(sobjectget);
        system.debug('check obj'+objectType);
         Schema.DescribeSObjectResult res = objectType.getDescribe();
         Schema.DescribeFieldResult fieldResult = res.fields.getMap().get(selectedfields).getDescribe();
         List<Schema.PicklistEntry> pl = fieldResult.getPicklistValues();
         for(Schema.PicklistEntry picListVal : pl) {
            picKlistValueList.add(picListVal.getLabel());
         }
        return picKlistValueList;
    }
}