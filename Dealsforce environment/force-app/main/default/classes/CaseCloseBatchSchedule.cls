public class CaseCloseBatchSchedule implements schedulable {
    public void execute(SchedulableContext SC){
       CaseBatchApex cs = new CaseBatchApex();
       Database.executeBatch(cs,2);
       
    }

}