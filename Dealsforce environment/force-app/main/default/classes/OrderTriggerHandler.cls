public class OrderTriggerHandler {
    public void onBeforeInsert(List<Order> newList){
        
    }
     public void onAfterInsert(List<Order> newList,Map<Id,Order> newMap){
        Messaging.SingleEmailMessage mymail = new Messaging.SingleEmailMessage();
String[] toaddresses = new String[] {'vepadarajesh12@gmail.com'}; 


mymail.setToAddresses(toAddresses);
//mymail.setCcAddresses(ccAddresses);
//mymail.setBccAddresses(bccAddresses);
mymail.setReplyTo('support@example.com');
mymail.setSenderDisplayName('Salesforce Support');
mymail.setSubject('An email from Salesforce');
mymail.setPlainTextBody('The Order Is Successfully Created');
//mymail.setHtmlBody(‘<p> This email has been sent through Apex</p>`);

Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mymail });
  }

    
    
     public void onBeforeUpdate(List<Order> newList,Map<Id,Order> newMap,List<Order> oldList,Map<Id,Order> oldMap){
        
    }
     public void onAfterUpdate(List<Order> newList,Map<Id,Order> newMap,List<Order> oldList,Map<Id,Order> oldMap){
        List<Order> newOrdList = newMap.values();
        List<Order> oldOrdList = oldMap.values();
        
          String newStatus = newOrdList[0].Status;
          String oldStatus = oldOrdList[0].Status;
         if(newStatus != oldStatus && newStatus == 'Dispatched'){
               Messaging.SingleEmailMessage mymail = new Messaging.SingleEmailMessage();
String[] toaddresses = new String[] {'vepadarajesh12@gmail.com'}; 


mymail.setToAddresses(toAddresses);
//mymail.setCcAddresses(ccAddresses);
//mymail.setBccAddresses(bccAddresses);
mymail.setReplyTo('support@example.com');
mymail.setSenderDisplayName('Salesforce Support');
mymail.setSubject('An email of Order from Salesforce');
mymail.setPlainTextBody('The Status of Order Is Successfully changed to Dispatched');
//mymail.setHtmlBody(‘<p> This email has been sent through Apex</p>`);

Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mymail });
         }
         
    }
     public void onBeforeDelete(List<Order> oldList,Map<Id,Order> oldMap){
        
    }
     public void onAfterDelete(List<Order> oldList,Map<Id,Order> oldMap){
         Messaging.SingleEmailMessage mymail = new Messaging.SingleEmailMessage();
String[] toaddresses = new String[] {'vepadarajesh12@gmail.com'}; 


mymail.setToAddresses(toAddresses);
//mymail.setCcAddresses(ccAddresses);
//mymail.setBccAddresses(bccAddresses);
mymail.setReplyTo('support@example.com');
mymail.setSenderDisplayName('Salesforce Support');
mymail.setSubject('An email of Order deletion from Salesforce');
mymail.setPlainTextBody('The Order Is Successfully deleted ');
//mymail.setHtmlBody(‘<p> This email has been sent through Apex</p>`);

Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mymail });
    }
     public void onAfterUndelete(List<Order> newList,Map<Id,Order> newMap){
        
    }
}