trigger DonationTrigger on Donation__c (before insert,after insert,
                                       before update,after update,
                                       before delete,after delete
                                      ) {
                                           
                                           Boolean isInsert = trigger.isInsert;
                                           Boolean isUpdate = trigger.isUpdate;
                                           Boolean isDelete = trigger.isDelete;
                                           Boolean isAfter = trigger.isAfter;
                                           Boolean isBefore = trigger.isBefore;
                                           system.debug('isInsert####'+isInsert);
                                           system.debug('isUpdate####'+isUpdate);
                                           system.debug('isDelete####'+isDelete);
                                           system.debug('isAfter####'+isAfter);
                                           system.debug('isBefore####'+isBefore);

}