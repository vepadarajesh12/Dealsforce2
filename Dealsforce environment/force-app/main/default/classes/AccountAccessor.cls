public class AccountAccessor {
 
    public List<Account> fetchAccounts(){
        AccountImplementor implementor = new AccountImplementor();
      List<Account> accList = implementor.fetchAccounts();
       List<String> x = new List<String>();
        x.add('Name');
        x.add('Phone');
        x.add('Active__c');
        x.add('Industry');
        String conditionInfo = 'phone != NULL AND Industry != NULL AND RATING =\'HOT\'';
        String objectnan = 'Account';
        
        // return implementor.fetchAccountsWithFields(x,conditionInfo);
      //return implementor.fetchDataWithFields(x,conditionInfo,objectnan);
        List<String> conFields = new List<String>();
        conFields.add('LastName');
        conFields.add('AccountId');
        conFields.add('Account.Name');
        String conObject = 'Contact';
        String conCondition = 'AccountId != NULL';
        
        List<SObject> conList = implementor.fetchDataWithFields(conFields,conCondition,conObject);
       
        Boolean isExists =false;
        Boolean iseligible = false;
        system.debug('ComatctSice####'+conList.size());
        if(conList.size()>0){
            isExists = true;
            for(Contact eachCon : (List<Contact>) conlist){
                if(eachCon.Account.Name.ContainsIgnoreCase('ltd')){
                    isEligible = true ;
                }
                else if(eachCon.LastName.ContainsIgnoreCase('modi')){
                    isEligible = true;
                }
            }
            
        }
        return implementor.fetchDataWithFields(conFields,conCondition,conObject);
           
        
        
    }
    


}