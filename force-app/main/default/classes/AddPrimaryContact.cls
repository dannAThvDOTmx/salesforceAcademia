public class AddPrimaryContact implements Queueable{
    
    private Contact contact;
    private String state;
    
    public AddPrimaryContact(Contact cont, String stateabb){
        this.contact = cont;
        this.state = stateabb;
    }
    public void execute(QueueableContext context){
        List<Account> accs = [SELECT Id, BillingState FROM Account  WHERE BillingState =: state];
    }
}