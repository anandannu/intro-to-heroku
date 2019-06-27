trigger NumberOfConCreate on Account (after insert,after update) {
    Set<Id> setId = new Set<Id>();
    Decimal Count;
    if(Trigger.isInsert) {
            for(Account a : Trigger.New) {
        setId.add(a.id);
        Count = Integer.ValueOf(a.Number_of_Contact__c);
    }
    System.debug('This is value of fields'+Count);
    List<contact> conList = new List<contact>();
    for(Account a:Trigger.New){
        for(Integer i=1 ; i<= Count; i++) {
            contact c = new contact();
            c.LastName = 'Anand'+i;
            c.AccountId = a.Id;
            conList.add(c);
        }
       Insert conList; 
    }
    }

    if(Trigger.isUpdate) {
        for(Account a:Trigger.new) {
            setId.add(a.Id);
            Count = Integer.ValueOf(a.Number_of_Contact__c);
        }
        List<Contact> con = [Select id,LastName from contact Where AccountId =:setId];
        if(Count != con.size()){
            System.debug('Value of variable'+Count);
            System.debug('Value of variable'+con.size());
            Count = Count - con.size();
            List<contact> conList = new List<contact>();
            for(Account a:Trigger.New){
                for(Integer i=1 ; i<= Count; i++) {
                    contact c = new contact();
                    c.LastName = 'Anand'+i;
                    c.AccountId = a.Id;
                    conList.add(c);
                }
                Insert conList; 
            }
        }
    }    
}