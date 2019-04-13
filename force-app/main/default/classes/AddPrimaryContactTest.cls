@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup(){
        List<Account> accs = new List<Account>();
        for(Integer i=0; i<50;i++){
            Account accBillingNY = new Account(Name='TestAccount '+i, BillingState = 'NY');
            Account accBillingCA = new Account(Name='TestAccount '+i, BillingState = 'CA');
            accs.add(accBillingNY);
            accs.add(accBillingCA);
        }
        insert accs;
    }
    static testMethod void testQueueable(){
        Contact conn = new Contact(LastName='TestQueueable');
        AddPrimaryContact addPrimContact = new AddPrimaryContact(conn,'CA');
        Test.startTest();
        System.enqueueJob(addPrimContact);
        Test.stopTest();
        
        System.assertEquals(50, [SELECT COUNT() FROM Contact WHERE AccountId IN :[SELECT Id FROM Account WHERE BillingState = 'CA']]);
        System.assertEquals(0, [SELECT COUNT() FROM Contact WHERE AccountId IN :[SELECT Id FROM Account WHERE BillingState = 'NY']]);
    }
}