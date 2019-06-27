public class standardMethods {
   public Account acc {get;set;}
      
    public standardMethods(ApexPages.StandardController stdController)
    {
        stdController.addFields(new List<String>{'Name', 'Region__c'});
        this.acc = (Account)stdController.getRecord();
        system.debug('this is new field'+acc.Rating);
    }
 
}