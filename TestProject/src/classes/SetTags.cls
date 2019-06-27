public class SetTags {
     ApexPages.StandardSetController setCon;
    public setTags(ApexPages.StandardSetController controller) {
        setCon = controller;
    }
    public List<Account> getMyRecordsSize() {
        return setCon.getRecords();
       
    }
}