trigger Opptrigger on Opportunity (after insert) {

List<Contract> getContracts = new List<Contract>(); 
for(Opportunity opp: (List<Opportunity>) Trigger.New) { 
Contract con = [SELECT Id FROM Contract WHERE Id =: opp.ContractId]; 
con.Description = 'This is the contract for Opportunity ' + opp.Name; 
getContracts.add(con); 
} 
update getContracts; 

}