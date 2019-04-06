@isTest
private class AccountProcessorTest {
    
    @isTest
    private static void testAccountProcessor(){
        List<Id> accIds = new List<Id>();
        Account a = new Account();
        a.Name = 'Test';
        insert a;
        
        accIds.add(a.Id);
        
        List<Contact> addContacts = new List<Contact>();
        for(Integer i = 0; i < 10; i++) {
            Contact c = new Contact();
            c.LastName = 'Test ' + i;
            c.AccountId = a.Id;
            addContacts.add(c);
        }
        
        insert addContacts;
        
        Test.setMock(HttpCalloutMock.class, new AccountProcessorCalloutMock());
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        
        Account checkNumber = [select Number_of_Contacts__c from Account where Id =: a.Id];
        
        System.assertEquals(10, checkNumber.Number_of_Contacts__c, 'No coinciden los numeros de contactos asignados a la cuenta');
        
    }
}