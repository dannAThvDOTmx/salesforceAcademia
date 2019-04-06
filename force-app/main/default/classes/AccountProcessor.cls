global class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> recordsIds){
        List<Account> accsToUpdate = new List<Account>();
        for(AggregateResult ar: [Select AccountId accId, Count(Id) contactCount from Contact where AccountId in: recordsIds group by AccountId]) {
            Account a = new Account();
            a.Id = (Id) ar.get('accId');
            a.Number_of_Contacts__c = (Integer) ar.get('contactCount');
        
            accsToUpdate.add(a);
        }
        
        update accsToUpdate;
    }
}