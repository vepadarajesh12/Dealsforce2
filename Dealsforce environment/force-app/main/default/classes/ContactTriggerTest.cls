@isTest
public class ContactTriggerTest {
    
    public static testmethod void positiveScenario(){
        
        Contact con = new Contact();
        con.LastName = 'Test';
        insert con;
        con.LastName = 'Test Update';
        update con;
        delete con;
        undelete con;
    }
    
         
        
      
        
       
        
    

}