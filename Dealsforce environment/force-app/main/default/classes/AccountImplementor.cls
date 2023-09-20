public class AccountImplementor {
    public List<Account> fetchAccounts(){
        return [select Id,Name from Account];
    }
    
      public List<Account> fetchAccountsWithFields(List<String> fields,String Condition){
          String concatenatedString = string.join(fields, ',');
         system.debug('Concatenatedsteirng####'+concatenatedString);
          String queryString='select '+concatenatedString+' from Account where '+Condition;
          system.debug('queryString###'+queryString);
          return database.query(queryString);
          
        
    }     
    
     public List<SObject> fetchDataWithFields(List<String> fields,String Condition, String objectname){
          String concatenatedString = string.join(fields, ',');
         system.debug('Concatenatedsteirng####'+concatenatedString);
          String queryString='select '+concatenatedString+' from '+objectname+' where '+Condition;
          system.debug('queryString###'+queryString);
          return database.query(queryString);
          
        
    }     
    

}