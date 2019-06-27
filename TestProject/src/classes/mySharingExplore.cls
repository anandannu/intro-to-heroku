public inherited sharing class mySharingExplore {
    public List<Account> account{get; set;}
	public mySharingExplore(){
		account = [select id, Name from Account];
	}	
}