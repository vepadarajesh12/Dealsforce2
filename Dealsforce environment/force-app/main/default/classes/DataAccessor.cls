public class DataAccessor {
    // fetch account by given the name
    public list<Account> fetchAccounts(String name){
        list<Account> accList = [select Id,name from Account where Name =: name ];
        return accList;
    }
    //fetch account by matching the name
    public list<Account> fetchAccountsByMatchingNames(String passingname){
        String queryFilter = '%'+passingname+'%';
        list<Account> accList = [select id,name from Account where name like: queryFilter];
        return accList;
    } 
    // find opportunity greater than given amount
    public list<Opportunity> fetchOpportunity(Integer passedamount){
       list<Opportunity> oppList= [select Id,amount from Opportunity where amount >: passedamount];
        return oppList;
    }
    // create a new account
    public void createAcc (String x){
        Account acc = new Account();
        acc.name = x;
        insert acc;
    }
    //  create contact for every matching account by name
    public list<Contact> createContactForEveryAccount(String passingname){
        String queryFilter = '%'+'passingname'+'%';
        list<Account> accList = [select Id,Name from Account where Name like: queryFilter];
        if(accList.size()>0){
            system.debug('ContactExists###'+accList.size());
            list<Contact> conList = new list<Contact>();
            for(Account eachAcc : accList){
                Contact con = new Contact();
                con.FirstName =eachAcc.Name;
                con.LastName =eachAcc.Name;
                conList.add(con);
            }
            insert conList;
            return conList;
            
        }
        else{
            system.debug('ContactDoesnotExists###');
            return null;
        }
        }
}