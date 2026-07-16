public class AccountHandler {
    
    public static void contactCount(List<Contact> conList) {

        set<string> newemail = new set<string>();
        for(contact c : conlist){
            if(c.email != Null){
                newemail.add(c.email);
            }
        }
        
        list<contact> existingcontact = [select accountid, email from contact where email IN :newemail];
        map<id, string> accountids = new map<id, string>();
        for(contact c : existingcontact){
            accountids.put(c.accountid, c.Email);
        }
        list<account> existingaccount = [select id, name, Contact_count__c from account where id IN: accountids.keyset()];
        
    }}