public class AddPrimaryContact implements Queueable{
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact cont, String stateabb){
        this.contact = cont;
        this.state = stateabb;
    }
    public void execute(QueueableContext context){
        List<Account> accs = new List<Account>();
        List<Contact> cons = new List<Contact>();
        for(Account acc : [SELECT Id, BillingState FROM Account  WHERE BillingState =: state LIMIT 200]){
            Contact conn = contact.clone();
            conn.AccountId = acc.Id;
            cons.add(conn);
            accs.add(acc);
        }
        insert cons;
        update accs;
    }
}