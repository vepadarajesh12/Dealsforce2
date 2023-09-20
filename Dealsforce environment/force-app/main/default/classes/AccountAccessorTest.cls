@isTest 
public class AccountAccessorTest {
    public static Testmethod void accountAccessorCheck(){
        Account acc = new Account();
        acc.name = 'Check account ltd';
        insert acc;
        Contact con = new Contact();
        con.LastName ='Rajesh';
        con.AccountId = acc.Id;
        insert con;
         AccountAccessor accCodeCoverage = new AccountAccessor();
        accCodeCoverage.fetchAccounts();
    }
       public static Testmethod void accountAccessorCheck2GG(){ 
        Account acc2 = new Account();
        acc2.name = 'Check account';
        insert acc2;
        Contact con2 = new Contact();
        con2.LastName ='Rajesh Modi';
        con2.AccountId = acc2.Id;
        insert con2;
         AccountAccessor accCodeCoverage = new AccountAccessor();
        accCodeCoverage.fetchAccounts();
    }

}