public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String lname){
        List<Contact> lcon = new List<Contact>();
        for(Integer i=0;i<numContacts;i++){
            Contact con = new Contact();
            con.FirstName = 'Test '+i;
            con.LastName = lname;
            lcon.add(con);
        }
        return lcon;
    }
}