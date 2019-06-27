public class OppController {
    
    @AuraEnabled
    public static List<Contact> getContactList(ID oppId) {
      
        List<Contact> contactList = [ Select Id, LastName From Contact Where AccountId In 
                                     (Select AccountId From Opportunity Where Id=:oppId)];   
        return contactList;
    }
     @AuraEnabled
    public static void updateConRole(List<ID> conIdsList, ID OppId, String roleVar) {
        
        List<OpportunityContactRole> newContactRoleList = new List<OpportunityContactRole>();
        for(ID idss : conIdsList){
            OpportunityContactRole newContactRole = new OpportunityContactRole();
            newContactRole.OpportunityId = OppId;
            newContactRole.ContactId  = idss;
            newContactRole.Role= roleVar;
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