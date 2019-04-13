trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    if(Trigger.isAfter && Trigger.isInsert  || Trigger.isAfter && Trigger.isUpdate){
        insertTaskToClosedWonOppt.insertTask(Trigger.new);
    }
}