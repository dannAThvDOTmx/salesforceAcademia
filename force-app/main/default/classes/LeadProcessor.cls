global class LeadProcessor implements Database.Batchable<sObject> {
    global Integer recordsUpdated = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> leads = new List<Lead>();
        for(Lead ld: scope){
            ld.LeadSource = 'Dreamforce';
            //leads.add(new Lead(LeadSource ='NoSource'));
            leads.add(ld);
            recordsUpdated = recordsUpdated + 1;
        }
        update leads;
    }
    
    global void finish(Database.BatchableContext bc){
        System.debug('Record updated '+recordsUpdated);
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email FROM AsyncApexJob WHERE Id =: bc.getJobId()];
        System.debug(job);
    }
}