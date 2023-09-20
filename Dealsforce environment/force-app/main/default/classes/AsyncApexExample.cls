public class AsyncApexExample {
    @future
    public static void handlerInFuture(){
        List<Account> accList = [select Id,Industry from Account where Name like '%test%'];
        for(Account eachAcc : accList){
            eachAcc.Industry = 'Banking';
            
        }
        update accList;
        handlerInFuture2();
        System.enqueueJob(new AccountUpdateQueueable());
    }
    
     @future
    public static void handlerInFuture2(){
        List<Account> accList = [select Id,Industry from Account where Name like '%test%'];
        for(Account eachAcc : accList){
            eachAcc.Industry = 'Banking';
            
        }
        update accList;
        System.enqueueJob(new AccountUpdateQueueable());
    }
}