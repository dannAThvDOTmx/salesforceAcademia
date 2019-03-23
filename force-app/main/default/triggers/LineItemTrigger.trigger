trigger LineItemTrigger on Line_Item__c (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        ProductLineItemManager.insertProductLineItem(Trigger.new);
    }        
}