public class AccountManager {
    public static void accountToMatchBillingZip(List<Account> toInsertAcc){
        for(Account acc: toInsertAcc){
            if(acc.BillingPostalCode != '' && acc.Match_Billing_Address__c == true){
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
}