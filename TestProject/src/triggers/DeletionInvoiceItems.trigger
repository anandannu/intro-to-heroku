trigger DeletionInvoiceItems on Invoice__c (before delete) {
	Set<Id> invId = new Set<Id>();
    for(Invoice__c inv: trigger.old) {
        invId.add(inv.Id);
    }
    String errorMsg ='this is not delete';
    List<Invoice_Items__c> invItemList = [Select id,Invoice__c from Invoice_Items__c Where Invoice__c =:invId];    
    if(invItemList.size() > 0) {
        for(Invoice__c inv :trigger.old) {
            inv.addError(errorMsg);
        }
    }
}