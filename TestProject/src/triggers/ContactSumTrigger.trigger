trigger ContactSumTrigger on Contact (After insert, After delete, After undelete) {
    Set<Id> accId = new Set<Id>();
    If(Trigger.isInsert || Trigger.isUndelete) {        
        for(Contact con : trigger.new) {
            accId.add(con.AccountId);
        }
    }
    if(Trigger.isDelete){
        for(Contact con : trigger.old) {
            accId.add(con.AccountId);
        }
    }
    List<Account> accList = [Select id, Name,(Select id,FirstName,LastName from Contacts) from Account Where id =:accId];
    List<Account> accListUpdate = new List<Account>();
    For(Account acc :accList) {
        acc.Number_of_contact__c  =  acc.Contacts.size();
        accListUpdate.add(acc);
    }
    try{
        update accListUpdate;
    }catch(System.Exception e){
        
    }
}