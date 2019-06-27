trigger TriggeronCase on Case (before insert,after insert) {

 if(trigger.isbefore){
    
    system.debug('before old List data'+trigger.old);
    system.debug('before new List  data'+trigger.new);
    system.debug('before old map data'+trigger.oldmap);
    system.debug('before new map  data'+trigger.newmap);
 }
 
 if(trigger.isafter){
    
    system.debug('after old List data'+trigger.old);
    system.debug('after new List  data'+trigger.new);
    system.debug('after old map data'+trigger.oldmap);
    system.debug('after new map  data'+trigger.newmap);
 }      

}