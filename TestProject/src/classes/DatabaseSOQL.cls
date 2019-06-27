public class DatabaseSOQL {
    // Create the list of sObjects to insert
    public void DatabaseSOQL() {
    List<Account> acctList = new List<Account>();
    for(integer i=0 ; i<4; i++) {
         account acc = new account();
    	 acc.Name='Ansdnf'+i;
         acctList.add(acc);
    }
    
    // DML statement
    Database.SaveResult[] srList = Database.insert(acctList, false);
        system.debug('listresult'+srList);
    
    // Iterate through each returned result
    for (Database.SaveResult sr : srList) {
        if (sr.isSuccess()) {
            // Operation was successful, so get the ID of the record that was processed
            System.debug('Successfully inserted account. Account ID: ' + sr.getId());
            system.debug('listresult'+sr);
        }
        else {
            // Operation failed, so get all errors                
            for(Database.Error err : sr.getErrors()) {
                System.debug('The following error has occurred.');                    
                System.debug(err.getStatusCode() + ': ' + err.getMessage());
                System.debug('Account fields that affected this error: ' + err.getFields());
            }
        }
    }
    }
}