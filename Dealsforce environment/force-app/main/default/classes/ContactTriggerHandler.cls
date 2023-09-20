public class ContactTriggerHandler{
    static Boolean isCalled = false;
    public void onBeforeInsert(List<Contact> newList){
       List<Contact> newConList=newList;
        set<Id> accIdSet = new set<Id>();
            for(Contact eachCon : newConList){
        Contact  con= eachCon;
        Id newAccountInfo = con.AccountId;
               accIdSet.add(newAccountInfo) ;
            }
        List<AggregateResult> aggResult =[SELECT count(id) totCount,AccountId FROM Contact where AccountId In:accIdSet GROUP by AccountId];
        Map<Id,Integer> accWithCount = new Map<Id,Integer>();
        for(AggregateResult eachAgg : aggResult){
            
        accWithCount.put((Id)eachAgg.get('AccountId'),(Integer)eachAgg.get('totCount'));          
        }
        for(Contact eachCon : newConList){
        Id accId = eachCon.AccountId;
            if(accWithCount.Containskey(accId)){
                if(accWithCount.get(accId)>0){
                    
                }else{
                    eachCon.Is_Primary__c = true;
                }
                
            }else{
                eachCon.Is_Primary__c = true; 
            }
        }
    }
     public void onAfterInsert(List<Contact> newList,map<Id,Contact> newMap){
       List<Contact> ConList = newMap.values();
         set<Id> newConSet = newMap.keySet();
         List<Account> updatedAccList = new List<Account>();
         for(Contact eachCon : ConList){
             Contact newCon = eachCon;
         Boolean isPrimaryContact = newCon.Is_Primary__c;
          if(isPrimaryContact){
              Id AccountId = newCon.AccountId;
        Account acc =new Account();
         acc.id = AccountId;
         acc.phone = newCon.phone;
         updatedAccList.add(acc);  
             
        
         }
         
       } 
     // update updatedAccList;
         
         reusebilitySameOperation(newMap);
        
       }
     
     public void onBeforeUpdate(List<Contact> newList,map<Id,Contact> newMap,
                              List<Contact> oldList,map<Id,Contact> oldMap){
                                List<Contact> newConList = newMap.values();
                                List<Contact> oldConList = oldMap.values();
                                Boolean newPrimary = newConList[0].Is_Primary__c;
                                Boolean oldPrimary = oldConList[0].Is_Primary__c;
                                  if(newPrimary != oldprimary && newPrimary == false &&  !ContactTriggerHandler.isCalled ){
                                      newConList[0].addError('Account should have atleast one primary contact');
                                  }
                                  
                                  for(Contact con : newConList){
                                      if(con.Activated__c == true){
                                          con.Status__c = 'Ready For Communication';
                                      }
                                  }
    }
    public void onAfterUpdate(List<Contact> newList,map<Id,Contact> newMap,
                              List<Contact> oldList,map<Id,Contact> oldMap){
                               /*   Integer x =20;
                                  if(x<100){
                                 Account acc = new Account();
                                  acc.name = ' info';
                                  insert acc;
                                  Contact con = new Contact();
                                  con.LastName = 'contact info';
                                  insert con;
                                  Case cs = new Case();
                                  cs.AccountId = acc.Id;
                                  cs.Description ='Test Case Creation';
                                  cs.Priority = 'high';
                                  insert cs ;*/
               reusebilitySameOperation(newMap);                
}
                              
    public void onBeforeDelete(List<Contact> oldList,map<Id,Contact> oldMap){
       List<Contact> oldInfo = oldMap.values(); 
        for(Contact eachCon : oldInfo){
            Contact oldCon = eachCon;
        if(oldCon.Is_Primary__c){
            oldCon.addError('you cant delete the contact because it is primary');
        } 
        }
        List<Contact> oldConList =  oldMap.values();
        Contact eachCon = oldConList[0];
      List<Compensation__c> existingComList = [select Id from Compensation__c where Employee_Name__c =:eachCon.Id];
        delete existingComList;
               }
        
    public void onAfterDelete(List<Contact> oldList,map<Id,Contact> oldMap){
    
    }
     public void onAfterUndelete(List<Contact> newList,map<Id,Contact> newMap){
        
    }
    public void reusebilitySameOperation(map<Id,Contact> newMap){
        ContactTriggerHandler.isCalled = true;
        List<Contact>  newConList = newMap.values();
         set<Id> accIdSet = newMap.keySet();
      //List<Contact> existConList = new List<Contact>();
                for(Contact eachCon : newConList){
           Contact newCon = eachCon;
          
                                   if(newCon.Is_Primary__c){
                                    List<Contact> existingConList = [select Id,Is_Primary__c from Contact where AccountId =: newCon.AccountId 
                                       and Is_Primary__c = true and Id NOT IN :accIdSet];
                                      if(existingConList.size()>0){
                                          for(Contact existCon : existingConList){
                                              existCon.Is_Primary__c = false;
                                          }
                                      }
                                     update existingConList; 
                                  } 
        
           
            
        }
             
                            
    }
   
}