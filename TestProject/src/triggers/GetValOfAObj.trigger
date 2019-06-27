trigger GetValOfAObj on D__c (before insert,after update) {
    
   Set<Id> dId = new Set<Id>();
    for(D__c d: Trigger.new){
        dId.add(d.CField__c);
    }
    
    Map<Id,Id> cMap = new Map<Id,Id>();
    for(C__c c : [Select id,name,BField__c from C__c Where id =: dId]) {
        if(c.BField__c != null) {
            dId.add(c.BField__c);
            cMap.put(c.Id, c.BField__c);
        }   
    }
    
    Map<Id,Id> bMap = new Map<Id,Id>();
    for(B__c b :[Select id,Name,AField__c from B__c Where id =: dId]) {
        if(b.AField__c != null) {
            dId.add(b.AField__c);
            bMap.put(b.Id, b.AField__c);
        }
    }
    
    Map<Id,A__c> aMap = new Map<Id,A__c>([Select id,Name from A__c Where Id =:dId]);
    for(D__c d: Trigger.new){
        for(A__c a:aMap.values()) {
            d.A_Name__c = aMap.get(a.id).Name;
        }
    }
}