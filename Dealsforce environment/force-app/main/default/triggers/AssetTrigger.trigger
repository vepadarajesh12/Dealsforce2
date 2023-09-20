trigger AssetTrigger on Asset (after insert) {
    if(trigger.isInsert && trigger.isAfter){
       //AsyncApexExample.handlerInFuture();
       //system.enqueueJob(new AccountUpdateQueueable());
       // 
    }
}