@isTest
private class LeadProcessorTest {
    
    @testSetup
    static void setup(){
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<200;i++){
            leads.add(new Lead(LastName='testLead'+i, Company='CompanyTest '+i, Status='Open - Not Contacted', LeadSource= 'Dreamforce'));
        }
        insert leads;
    }
    static testmethod void test(){
        Test.startTest();
        LeadProcessor lps = new LeadProcessor();
        Id batchId = Database.executeBatch(lps);
        Test.stopTest();
        
        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}