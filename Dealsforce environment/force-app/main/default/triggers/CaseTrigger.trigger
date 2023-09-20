trigger CaseTrigger on Case (before insert) {
  
    for(Case cs : trigger.new){
        if(cs.Created__c == 'South India'){
            cs.IsEscalated = true;
           
        }
    
}
}