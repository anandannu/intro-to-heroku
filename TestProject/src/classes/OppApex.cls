public class OppApex {

	  
    @AuraEnabled
    public static List<Contact> getAllContact(id OppId ) {  
        List<Contact> conList = [Select Id,LastName,Email from contact Where AccountId In (Select AccountId From Opportunity where id =: OppId)];
        Return conList;
    }
    public Static void updateContactRole(String roleValue,id oppId, List<id> conId){
        system.debug('role value'+roleValue);
          List<OpportunityContactRole> newContactRoleList = new List<OpportunityContactRole>();
        for(ID coid : conId){
            OpportunityContactRole newContactRole = new OpportunityContactRole();
            newContactRole.OpportunityId = oppId;
            newContactRole.ContactId  = coid;
            newContactRole.Role= roleValue;
            newContactRole.IsPrimary = true;
            newContactRoleList.add(newContactRole);
        }
        
        try{
             UPSERT newContactRoleList; 
        }catch(DmlException e) { 
            throw new AuraHandledException(e.getMessage());
        }catch(Exception e){
            
            throw new AuraHandledException(e.getMessage());
        }
    }
}