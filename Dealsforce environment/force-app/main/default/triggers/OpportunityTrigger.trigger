trigger OpportunityTrigger on Opportunity (after insert ,after update,after delete,after undelete ) {
    
    
    if(trigger.isAfter){
      
     if(trigger.isInsert){
               OpportunityTriggerHandler trigHandler = new OpportunityTriggerHandler();
        trigHandler.onafterInsert(trigger.newMap);
                
            }
    
    if(trigger.isUpdate){
        OpportunityTriggerHandler trigHandler = new OpportunityTriggerHandler();
        trigHandler.onafterUpdate(trigger.newMap,trigger.oldMap);
    }
    if(trigger.isDelete){
           OpportunityTriggerHandler trigHandler = new OpportunityTriggerHandler();
        trigHandler.onafterDelete(trigger.oldMap);
    }
    if(trigger.isUndelete){
       OpportunityTriggerHandler trigHandler = new OpportunityTriggerHandler();
        trigHandler.onafterUndelete(trigger.newMap);
    }
                       
    }
}