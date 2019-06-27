trigger CreateContact on Account (after insert, before Update) {
    Set<Id> accId = new Set<Id>();
    if(Trigger.isInsert && Trigger.isAfter || Trigger.isbefore && Trigger.isupdate) {
        for(Account a : Trigger.new) {
            if( a.Type == 'Technology Partner') {
                accId.add(a.id);
                System.debug('Id of Account'+accId);
            }            
        }
    }
    
    if(accId.size() > 0) {
        List<contact> conList = new List<contact>();
        for(Account acc : Trigger.new){
            contact c = new contact ();
             c.LastName = 'Anand';
             c.AccountId = acc.Id; 
             c.Title    = 'Technology Partner';
            conList.add(c);
        }
    
            insert conList;
   }   
}