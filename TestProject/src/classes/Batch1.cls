global class Batch1 implements Database.Batchable<sObject>{
	 global Database.QueryLocator start(Database.BatchableContext BC)     {
        String query = 'Select Id from Account where CreatedDate >= LAST_N_DAYS:30';                
        return Database.getQueryLocator(query);     
    }    
    global void execute(Database.BatchableContext BC, List<Account> scope)     {        
        for(Account a : scope)        
        {            
            a.Name = a.Name + 'Updated by Batch job';        
        }        
        update scope;       
    }    
    global void finish(Database.BatchableContext BC) {  
    
    
    }
}