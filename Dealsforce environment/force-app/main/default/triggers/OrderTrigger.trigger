trigger OrderTrigger on Order (after insert,after update,after delete) {
    
    if(trigger.isInsert == true && trigger.isAfter == true){
     OrderTriggerHandler orderTrig = new OrderTriggerHandler();
        orderTrig.onAfterInsert(Trigger.new,Trigger.newMap);
    }
    
    if(trigger.isUpdate && trigger.isAfter){
        OrderTriggerHandler orderTrig = new OrderTriggerHandler();
        orderTrig.onAfterUpdate(Trigger.new,Trigger.newMap,Trigger.old,Trigger.oldMap);
    }
    if(trigger.isDelete && trigger.isAfter){
        OrderTriggerHandler orderTrig = new OrderTriggerHandler();
        orderTrig.onAfterDelete(Trigger.old,Trigger.oldMap);
    }
        
    }