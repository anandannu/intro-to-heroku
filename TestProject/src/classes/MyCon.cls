public class MyCon {
  Account account;

  public PageReference save() {
    try{
        update account;
        //PageReference pageRef = new PageReference('ObjAccessibility');
        PageReference secondPage = Page.ObjAccessibility;
        secondPage.setRedirect(true);
        return secondPage;

       }
    catch(DmlException ex){
        ApexPages.addMessages(ex);
       }
    return null;
  }

  public String getName() {
    return 'MyController';
  }

  public Account getAccount() {
    if(account == null)
      account = [select id, name, numberoflocations__c from Account
        where id = :ApexPages.currentPage().getParameters().get('id')];
      return account;

  }
}