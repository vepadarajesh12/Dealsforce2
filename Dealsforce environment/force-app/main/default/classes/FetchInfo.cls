public class FetchInfo{
public Integer marks = 99;
    public String name = 'Rajesh';
    
    public void doTask(){
        //perform Task
        system.debug('voidmarks###'+marks);
    }
    public Integer add(Integer  a,Integer b){
        return a+b;
    }
    
    public String concatenate(String x,String y){
        return x+y;
    }
    public Decimal calcuper(Decimal totalmarks,Decimal actualmarks){
        return (actualmarks/totalmarks)*100;
    }
    public Integer incrementSalary(Integer currentSalary,Integer updatedSalary){
        return updatedSalary-currentSalary;
    }
     public Integer add(Integer  a,Integer b,Integer c){
         Integer firstAdd = add(a,b);
         Integer secondAdd = add(firstAdd,c);
         
        return secondAdd;
    }
    public void check(){
        List<Contact> conList = new List<Contact>();
        map<Id,Contact> mapList = new map<Id,Contact>();
        ContactTriggerHandler conTrig = new ContactTriggerHandler();
        conTrig.onAfterInsert(conList,mapList);
    }
    
    
    
    
    
    
    
}