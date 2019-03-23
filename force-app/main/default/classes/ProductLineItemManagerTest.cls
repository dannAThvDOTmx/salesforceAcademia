@istest
private class ProductLineItemManagerTest {
    
    @istest
    private static void insertInPLITest(){
        Line_Item__c lit = new Line_Item__c(Description__c = 'Desp prueba', Type__c = 'Small');
        Test.startTest();
        insert lit;
        
        Product_Line_Item__c pli = [SELECT Id, Description__c, Type__c FROM Product_Line_Item__c WHERE Line_Item__c =: (lit.id) ];
        
        System.assertEquals(pli.Description__c, lit.Description__c,'Son iguales');
        Test.stopTest();
    }
}