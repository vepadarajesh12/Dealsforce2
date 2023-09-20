trigger LeaveTrigger on Leave__c (after insert) {
    Leave__c lea = new Leave__c();
    if(lea.New_leave__c == true){
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

}