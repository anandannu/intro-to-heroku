public with sharing class MyUtils {
    
    public static String fetchFieldNames(String obj) {
        String objthis = obj;
        Map<String, Schema.SObjectType> objMap = Schema.getGlobalDescribe(); 
        Map <String, Schema.SObjectField> fieldMap = objMap.get(objthis).getDescribe().fields.getMap();     
            String commaSepratedFields = '';
            for(String fieldName : fieldMap.keyset()){
                if(commaSepratedFields == null || commaSepratedFields == ''){
                    commaSepratedFields = fieldName;
                }else{
                    commaSepratedFields = commaSepratedFields + ', ' + fieldName;
                }
            }
            return commaSepratedFields;
    }
}