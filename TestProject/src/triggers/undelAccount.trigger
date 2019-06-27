trigger undelAccount on Account (after undelete) {
    Set<id> accId = new Set<Id>();
    for(Account a:trigger.new){
        accId.add(a.Id);
    }
    List<contact> con = new List<contact>();
    for(Account acc : Trigger.new) {
        contact c = new contact();
        c.LastName  = 'Anand';
        c.AccountId = acc.id ;
        con.add(c);
    }
    insert con;
}