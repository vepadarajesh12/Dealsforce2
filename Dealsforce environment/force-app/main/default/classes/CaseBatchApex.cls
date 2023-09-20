public class CaseBatchApex implements Database.Batchable<sObject>,Database.stateful {
    public Integer successCount = 0;
    public Integer failureCount = 0;
   public Database.QueryLocator start(Database.BatchableContext BC){
       system.debug('Inside Start');
       List<Case> caseList = [select Id,Status from Case];
       system.debug('total size###'+caseList);
       return Database.getQueryLocator([select Id,AccountId,Status,CaseNumber from Case]);
   }

   public void execute(Database.BatchableContext BC, List<sObject> scope){
       system.debug('beforeInsert####'+limits.getQueries());
       system.debug('beforeInsert####'+limits.getLimitQueries());
   List<Case> caseList = (List<Case>)scope;
       List<Asset> assList = new List<Asset>();
       for(Case eachCase : caseList){
          eachCase.Description = 'update through batch ';
           assList.add(new Asset(Name= 'Test'+eachCase.CaseNumber,AccountId = eachCase.AccountId));
       }
       insert assList; 
        System.enqueueJob(new AccountUpdateQueueable());
       //update caseList;
       database.SaveResult[] srList = Database.update(caseList,false);
for (Database.SaveResult sr : srList) {
   if (sr.isSuccess()) {
       system.debug('successCount###'+successCount);
       successCount = successCount + 1;
      // This condition will be executed for successful records and will fetch the ids 
      // of successful records
      System.debug('Successfully inserted Invoice. Invoice ID: ' + sr.getId());
      // Get the invoice id of inserted Account
   } else {
       failureCount = failureCount + 1;
      // This condition will be executed for failed records
      for(Database.Error objErr : sr.getErrors()) {
         System.debug('The following error has occurred.');
         
         // Printing error message in Debug log
         System.debug(objErr.getStatusCode() + ': ' + objErr.getMessage());
         System.debug('Invoice oject field which are affected by the error:' 
            + objErr.getFields());
      }
   }
}

        system.debug('AfterbeforeInsert####'+limits.getQueries());
       system.debug('AfterbInsert####'+limits.getLimitQueries());
    
        
      
   }

   public void finish(Database.BatchableContext BC){
    system.debug('Inside finish'+'successCount####'+successCount+'failureCount###'+failureCount); 
        Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
		String[] sendingTo = new String[]{'rajeshvepada308@gmail.com'};
		semail.setToAddresses(sendingTo);
		//String[] sendingToBccAdd = new String[]{'XXXXXXXXX@gmail.com'};
		//semail.setBccAddresses(sendingToBccAdd);
		//String[] sendingTocAdd = new String[]{'XXXXXXXXXXX@gmail.com'};
		//semail.setCcAddresses(sendingTocAdd);
		semail.setSubject('Case status');
		semail.setPlainTextBody('Hello!!!!!!!!!!The Batch process is completed successCount'+successCount+'failureCount###'+failureCount);
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail});
   }

}