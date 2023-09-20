trigger AccountTriggerRecursive on Account (After insert) {
    if(trigger.isInsert && trigger.isAfter){
        List<Contact> conList = new List<Contact>();
        for(Account eachAcc : trigger.new){
            Contact con = new Contact();
            con.LastName = eachAcc.Name;
           con.AccountId = eachAcc.Id;
            conList.add(con);
        }
        insert conList;
    }
}