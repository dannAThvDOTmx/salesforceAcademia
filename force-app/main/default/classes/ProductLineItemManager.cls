public class ProductLineItemManager {
    
    public static void insertProductLineItem(List<Line_Item__c> liItems){
        Product_Line_Item__c pli = new Product_Line_Item__c();
        
        for(Line_Item__c li : liItems){
            pli.Description__c = li.Description__c;
            pli.Type__c = (String) li.Type__c;
            pli.Line_Item__c = li.Id;
        }
        try{
            insert pli;
        }catch(Exception e){
            System.debug('Error insert product lie item------->		'+e.getMessage());
        }
    }
}