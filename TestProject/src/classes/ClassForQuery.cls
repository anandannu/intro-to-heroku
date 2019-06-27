public class ClassForQuery {
    public String q {get;set;}
    public List<Account> acc {get;set;}
    public void Search () {
      acc = Database.query('Select id,Name,Rating from Account Where Name like \'%'+ q +'%\'');
    }
}