trigger CalulateDays on Opportunity (before insert) {
    
    for(Opportunity op : Trigger.New) {
        Date startDate = op.Start_Date__c;
        Date dueDate  =  op.CloseDate;
        Integer numberDaysDue = startDate.daysBetween(dueDate);
        op.Number_of_Remaining_days__c = numberDaysDue;
        System.debug('Remaing days'+ numberDaysDue);
    }
    
}