trigger Accountrigger on Account (before insert,After insert) {
                                    system.debug('I am inside the trigger#####');
                                  list<Account> accList= trigger.new;
                                 system.debug('accList####'+accList) ;
    
    if(trigger.isInsert == true){
        system.debug('i am inside##');
        if(trigger.isBefore == true){
            system.debug('i am inside the before insert');
                               if(trigger.new[0].name.Contains('test')){
                              trigger.new[0].adderror('test is not recognised');
                               }
    }
        }
    if(trigger.isInsert == true && trigger.isAfter){
        system.debug('i am inside the after insert');
                               Contact con = new Contact();
                                     con.FirstName = 'scenario,';
                                     con.LastName = 'test';
                                     insert con;

    }
                                 
                               /*  list<Account> accList = new list<Account>();
                                 Account acc = new Account();
                                 acc.name='raghuram';
                                 accList.add(acc);
                                 */
    
                                
   
                                /* map<Id,Account> newMap = trigger.newMap;
                                 list<Account> accNew = newMap.values();
                                 set<Id> idNew = newMap.keyset();
                                
                                 system.debug('NewMap####'+newMap);
                                 */

    



}