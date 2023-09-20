public class AssetUpdateQueueable implements Queueable{
    public void execute(QueueableContext Context){
          List<Account> accList = [select Id,Industry from Account where Name like '%test%'];
        for(Account eachAcc : accList){
            eachAcc.Industry = 'Banking';
            
        }
        update accList;
    }
}