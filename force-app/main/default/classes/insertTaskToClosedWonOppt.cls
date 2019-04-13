public class insertTaskToClosedWonOppt {
    public static void insertTask(List<Opportunity> closedWonOppsList){
        List<Task> listTask = new List<Task>();
        for(Opportunity opp :[SELECT Id, StageName FROM Opportunity WHERE Id IN :closedWonOppsList AND StageName = 'Closed Won']){
            Task task = new Task(Subject='Follow Up Test Task', WhatId = opp.Id, Status = 'In Progress');
            listTask.add(task);
        }
        insert listTask;
    }
}