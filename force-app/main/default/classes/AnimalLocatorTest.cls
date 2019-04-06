@isTest
private class AnimalLocatorTest {
     @isTest
    static void testGetCallout(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('chicken', response,'Response was the expected');
    }
}