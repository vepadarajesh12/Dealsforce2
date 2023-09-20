trigger ContactTrigger on Contact (before insert,after insert,before update,after update,before delete,after delete,after undelete) {
    if(Trigger_Activator__mdt.getInstance('Contact').Is_Active__c){
       // on before insert
    if(trigger.isInsert == true && trigger.isBefore == true){
        system.debug('beforeinsert####'+trigger.new);
        system.debug('beforeinsert####'+trigger.newMap);
        system.debug('beforeinsert####'+trigger.old);
        system.debug('beforeinsert####'+trigger.oldMap);
        ContactTriggerHandler ConTriggerHandler = new ContactTriggerHandler();
        ConTriggerHandler.onBeforeInsert(trigger.new);
        
    }
    // on after insert
      if(trigger.isInsert == true && trigger.isAfter == true){
          system.debug('afterinsert####'+trigger.new);
        system.debug('afterinsert####'+trigger.newMap);
        system.debug('afterinsert####'+trigger.old);
        system.debug('afterinsert####'+trigger.oldMap);
         /* Account acc = new Account();
          acc.name = 'contact and account creation';
          insert acc;
*/
           ContactTriggerHandler ConTriggerHandler = new ContactTriggerHandler();
        ConTriggerHandler.onAfterInsert(trigger.new,trigger.newMap);
          if(RecursivePreventor.isCalled == false){
              RecursivePreventor.isCalled = true;
             List<Account> accList = new List<Account>();
          for(Contact eachCon : trigger.new){
              Account acc = new Account();
              acc.Name = eachCon.LastName;
              acc.ID = eachCon.AccountId;
              accList.add(acc);
          }
         // insert accList;  
          }
         
        
    }
    // on before update
      if(trigger.isUpdate == true && trigger.isBefore == true){
          system.debug('beforeupadte####'+trigger.new);
        system.debug('beforeupdate####'+trigger.newMap);
        system.debug('beforeupdate####'+trigger.old);
        system.debug('beforeupdate####'+trigger.oldMap);
           ContactTriggerHandler ConTriggerHandler = new ContactTriggerHandler();
        ConTriggerHandler.onBeforeUpdate(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
          
        
    }
    // on after update
      if(trigger.isUpdate == true && trigger.isAfter == true){
          system.debug('afterupdate####'+trigger.new);
        system.debug('afterupdate####'+trigger.newMap);
        system.debug('afterupdate####'+trigger.old);
        system.debug('afterupdate####'+trigger.oldMap);
           ContactTriggerHandler ConTriggerHandler = new ContactTriggerHandler();
        ConTriggerHandler.onAfterUpdate(trigger.new,trigger.newMap,trigger.old,trigger.oldMap);
        
    }
    // on before delete
      if(trigger.isDelete == true && trigger.isBefore == true){
          system.debug('beforedelete####'+trigger.new);
        system.debug('beforedelete####'+trigger.newMap);
        system.debug('beforedeletet####'+trigger.old);
        system.debug('beforedelete####'+trigger.oldMap);
 ContactTriggerHandler ConTriggerHandler = new ContactTriggerHandler();
        ConTriggerHandler.onBeforeDelete(trigger.old,trigger.oldMap);
        
    }
    // on after delete
      if(trigger.isDelete == true && trigger.isAfter == true){
          system.debug('afterdelete####'+trigger.new);
        system.debug('afterdelete####'+trigger.newMap);
        system.debug('afterdelete####'+trigger.old);
        system.debug('afterdelete####'+trigger.oldMap);
           ContactTriggerHandler ConTriggerHandler = new ContactTriggerHandler();
        ConTriggerHandler.onAfterDelete(trigger.old,trigger.oldMap);
        
    }
    // on after Undelete
      if(trigger.isUndelete == true && trigger.isAfter == true){
          system.debug('afterundelete####'+trigger.new);
        system.debug('afterundelete####'+trigger.newMap);
        system.debug('afterundelete####'+trigger.old);
        system.debug('afterundelete####'+trigger.oldMap);
           ContactTriggerHandler ConTriggerHandler = new ContactTriggerHandler();
        ConTriggerHandler.onAfterUndelete(trigger.new,trigger.newMap);
        
    }
       
    }
  
    
    
    
}