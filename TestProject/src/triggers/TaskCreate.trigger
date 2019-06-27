trigger TaskCreate on Opportunity (after insert,after update) {
    Set<Id> oppId = new Set<Id>();
    if(Trigger.isInsert || Trigger.isUpdate) {
        for(opportunity opp :Trigger.new) {
            if(opp.StageName == 'Closed Won') {
                oppId.add(opp.Id);
                system.debug('opportunity id'+ oppId);
            }
        }
    }
    
    if(oppId.size() >0){
        List<task> tkList = new List<task>();
        for(opportunity opp :Trigger.new) {
            task tk = new task();
            tk.subject = 'Follow up Task';
            tk.Priority = 'High';
            tk.WhatId = opp.Id;
            tkList.add(tk);
        }
        Insert tkList;
    }
}