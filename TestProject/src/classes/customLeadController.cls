public class customLeadController {
    @AuraEnabled
    public static List<Lead> LeadTest() {
        List<Lead> lead = [Select id,LastName,FirstName,Company,Email from Lead];
        return lead;
    }
    
     @AuraEnabled 
    public static List<user> fetchUser(){
       List<User> u = [select id,Name,Email from User ];
       return u;
    }
}