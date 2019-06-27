trigger CalculateAverage on Position__c (before insert) {    
    Decimal avg;
    for(Position__c pos : trigger.new) {
        avg = (pos.Mark1__c+pos.Mark2__c)/2;
        pos.Average__c=avg;
    }
}