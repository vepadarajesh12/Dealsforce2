public class OpportunityTriggerHandler {
     public void onafterInsert(Map<Id,Opportunity> newMap){
         reusebleOpportunityBulk('Insert',newMap);
    }
     public void onafterUpdate(Map<Id,Opportunity> newMap,Map<Id,Opportunity> oldMap){
         reusebleOpportunityOnUpdateBulk('Update',newMap,oldMap);
    }
     public void onafterDelete(Map<Id,Opportunity> oldMap){
         reusebleOpportunityBulk('Delete',oldMap);
    }
    
    public void onafterUndelete(Map<Id,Opportunity> newMap){
         reusebleOpportunityBulk('Undelete',newMap);
    }
    void reusebleOpportunityOnUpdateBulk(String dmlOperations,Map<Id,Opportunity> oppMap,Map<Id,Opportunity> oldMap){
       List<Opportunity> oppNewMap= oppMap.values() ;
        List<Account> toAccUpdate = new List<Account>();
         set<Id> newAccountSet = new set<Id>();
        set<Id> oldAccountSet = new set<Id>();
        for(Opportunity eachOpp : oppNewMap){    
        Id newAccountId = eachOpp.AccountId;
        Opportunity oldOpp = oldMap.get(eachOpp.Id);
             Id oldAccountId = oldOpp.AccountId;
            newAccountSet.add(newAccountId);
            oldAccountSet.add(oldAccountId);
          }
         List<Account> newAccList = [select Id,total_Amount__c from Account where Id IN:newAccountSet] ; 
           List<Account> oldAccList = [select Id,total_Amount__c from Account where Id In:oldAccountSet] ;
        Map<Id,Account> newMapInfo = new map<Id,Account>();
      Map<Id,Account> oldMapInfo = new map<Id,Account>();
      
          for(Account eachAcc : newAccList){
            newMapInfo.put(eachAcc.Id,eachAcc);
        }
          for(Account eachAcc : newAccList){
             oldMapInfo.put(eachAcc.Id,eachAcc);
        }
        for(Opportunity eachOpp : oppNewMap){
        decimal oppNewAmount = eachOpp.Amount;
        Id newAccountId = eachOpp.AccountId;
        Opportunity oldOpp = oldMap.get(eachOpp.Id);
        decimal oppOldAmount = oldOpp.Amount; 
        Id oldAccountId = oldOpp.AccountId;
       decimal finalAmount = 0;
        
        Boolean isIncreased = false;
        system.debug('oppNewAmount###'+oppNewAmount);
            system.debug('oppOldAmount###'+oppOldAmount);
        if(oppNewAmount > oppOldAmount){
        
            finalAmount = oppNewAmount - oppOldAmount;
            isIncreased = true;
        }
        else{
          finalAmount = oppOldAmount - oppNewAmount;  
        }
        if(newAccountId != oldAccountId){
            Decimal oppAmountForNew = 0;
            Decimal oppAmountForOld = 0;
            boolean isAmountChanged = false;
            if(oppNewAmount !=oppOldAmount){
                 oppAmountForNew = oppNewAmount;
                isAmountChanged = true;
                oppAmountForOld = oppOldAmount;
            }
          // Account newAcc = [select Id,total_Amount__c from Account where Id =:newAccountId] ; 
          //Account oldAcc = [select Id,total_Amount__c from Account where Id =:oldAccountId] ;
          Account newAcc = newMapInfo.get(eachOpp.AccountId);
            Account oldAcc = oldMapInfo.get(oldAccountId);
            if(! isAmountChanged){
              newAcc.total_Amount__c = newAcc.Total_Amount__c + finalAmount;
             oldAcc.total_Amount__c = oldAcc.Total_Amount__c - finalAmount; 
            toAccUpdate.add(newAcc);
            toAccUpdate.add(oldAcc); 
            }
            else{
            
            newAcc.total_Amount__c = newAcc.Total_Amount__c + oppAmountForNew;
             oldAcc.total_Amount__c = oldAcc.Total_Amount__c - oppAmountForOld;
            toAccUpdate.add(newAcc);
            toAccUpdate.add(oldAcc); 
            }
           
            
        }
 /*  Id newAccId = oppNewMap[0].AccountId;
    Account acc = [select id,Total_Amount__c from Account where Id =: newAccId];
   
    if(acc.Total_Amount__c == null){
        acc.Total_Amount__c = 0;
    }
        if(isIncreased){
    acc.Total_Amount__c = acc.Total_Amount__c+finalAmount;
        }
       else{
    acc.Total_Amount__c = acc.Total_Amount__c-finalAmount;
          
        }
      
      update acc;
*/
    }
        update toAccUpdate;
        
    }
    void reusebleOpportunity(String dmlOperations,Map<Id,Opportunity> oppMap){
        List<Opportunity> oppNewMap= oppMap.values() ;
    decimal oppAmount = oppNewMap[0].Amount;
   Id newAccountId = oppNewMap[0].AccountId;
    Account acc = [select id,Total_Amount__c from Account where Id =: newAccountId];
    system.debug('Accamount###'+acc.Total_Amount__c);
    if(acc.Total_Amount__c == null){
        acc.Total_Amount__c = 0;
    }
        if(dmlOperations == 'Insert' || dmlOperations == 'Undelete'){
    acc.Total_Amount__c = acc.Total_Amount__c+oppAmount;
        }
       else if(dmlOperations == 'Delete'){
    acc.Total_Amount__c = acc.Total_Amount__c-oppAmount;
        }
      
      update acc;
          
    }
    void reusebleOpportunityOnUpdate(String dmlOperations,Map<Id,Opportunity> oppMap,Map<Id,Opportunity> oldMap){
         List<Opportunity> oppNewMap= oppMap.values() ;
        decimal oppNewAmount = oppNewMap[0].Amount;
        Id newAccountId = oppNewMap[0].AccountId;
        List<Opportunity> oldMapList = oldMap.values();
        decimal oppOldAmount = oldMapList[0].Amount; 
        Id oldAccountId = oldMapList[0].AccountId;
       decimal finalAmount = 0;
        
        Boolean isIncreased = false;
        system.debug('oppNewAmount###'+oppNewAmount);
            system.debug('oppOldAmount###'+oppOldAmount);
        if(oppNewAmount > oppOldAmount){
        
            finalAmount = oppNewAmount - oppOldAmount;
            isIncreased = true;
        }
        else{
          finalAmount = oppOldAmount - oppNewAmount;  
        }
        if(newAccountId != oldAccountId){
            Account newAcc = [select Id,total_Amount__c from Account where Id =:newAccountId] ; 
             Account oldAcc = [select Id,total_Amount__c from Account where Id =:oldAccountId] ;
            newAcc.total_Amount__c = newAcc.Total_Amount__c + oppNewAmount;
             oldAcc.total_Amount__c = oldAcc.Total_Amount__c - oppNewAmount;
            update newAcc;
            update oldAcc;
        }
   Id newAccId = oppNewMap[0].AccountId;
    Account acc = [select id,Total_Amount__c from Account where Id =: newAccId];
   
    if(acc.Total_Amount__c == null){
        acc.Total_Amount__c = 0;
    }
        if(isIncreased){
    acc.Total_Amount__c = acc.Total_Amount__c+finalAmount;
        }
       else{
    acc.Total_Amount__c = acc.Total_Amount__c-finalAmount;
          
        }
      
      update acc;
    }
    
  /* void reusebleOpportunity(String dmlOperations,Map<Id,Opportunity> oppMap){
        List<Opportunity> oppNewMap= oppMap.values() ;
    decimal oppAmount = oppNewMap[0].Amount;
   Id newAccountId = oppNewMap[0].AccountId;
    Account acc = [select id,Total_Amount__c from Account where Id =: newAccountId];
    system.debug('Accamount###'+acc.Total_Amount__c);
    if(acc.Total_Amount__c == null){
        acc.Total_Amount__c = 0;
    }
        if(dmlOperations == 'Insert' || dmlOperations == 'Undelete'){
    acc.Total_Amount__c = acc.Total_Amount__c+oppAmount;
        }
       else if(dmlOperations == 'Delete'){
    acc.Total_Amount__c = acc.Total_Amount__c-oppAmount;
        }
      
      update acc;

        
    }*/
    
   void reusebleOpportunityBulk(String dmlOperations,Map<Id,Opportunity> oppMap){
   system.debug('OppMapSize###'+oppMap.size());
       List<Opportunity> oppNewMap= oppMap.values() ;
   List<Account> updateAccList = new List<Account>();
   set<Id> accSetId = new set<Id>();
        for(Opportunity eachOpp : oppNewMap){
       Id newAccountId = eachOpp.AccountId;
            accSetId.add(newAccountId);
       }
       List <Account> accList = [select id,Total_Amount__c from Account where Id IN: accSetId];
       map<Id,Account> accNewMap = new map<Id,Account>();
       for(Account eachAcc : accList){
           accNewMap.put(eachAcc.id,eachAcc);
         system.debug('eachAcc###'+eachAcc);
       }
       system.debug('accList###'+accList);
      map<Id,Account> accUpdatedToMap = new map<Id,Account>();
       for(Opportunity eachOpp : oppNewMap){
           system.debug('eachOpp###'+eachOpp); 
   decimal oppAmount = eachOpp.Amount;
      Id relatedAccountId = eachOpp.AccountId; 
            system.debug('relatedAccountId###'+relatedAccountId);
           if(accNewMap.Containskey(relatedAccountId)){
              system.debug('iscoming');
     
               Account acc =accNewMap.get(relatedAccountId);
             
            // system.debug('Accamount###'+acc.Total_Amount__c);
   if(acc.Total_Amount__c == null){
        acc.Total_Amount__c = 0;
    }
            /*  Decimal finalAmount = 0;
               if(finalAmount>0){
                   finalAmount = acc.Total_Amount__c +oppAmount;
               }*/
               
        if(dmlOperations == 'Insert' || dmlOperations == 'Undelete'){
    acc.Total_Amount__c = acc.Total_Amount__c+oppAmount;
           // finalAmount = finalAmount+oppAmount;
        }
       else if(dmlOperations == 'Delete'){
    acc.Total_Amount__c = acc.Total_Amount__c-oppAmount;
       // finalAmount = finalAmount-oppAmount;
       }
               if(!accUpdatedToMap.ContainsKey(acc.Id)){
                updateAccList.add(acc);
                   accUpdatedToMap.put(acc.Id,acc);
               }
     }
     }
       system.debug('updateAccList###'+updateAccList);
        update updateAccList;
   }
}