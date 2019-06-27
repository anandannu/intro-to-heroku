public class FunCon {
	
    String uname;

    public String getUsername() {
        return uname;
    }
            
    public PageReference sayHello() {
        uname = UserInfo.getName();
        return null;
    }
            
    public void setState(String n) {
        state = n;
        System.debug('THis is set state'+ state);
    }
            
    public String getState() {
        return state;
        
    }
            
    public PageReference methodOne() {
        return null;
    }
            
    private String state ='no';

}