public class AccountHan{
    // update contacts count on account record
    public static void contactCount(List<Contact> conList, list<contact> oldconlist) {
       
        set<id> accountids = new set<id>();
        if(conlist != Null){
            for(contact c : conlist){
            if(c.accountid != Null){
                accountids.add(c.accountid);
        }
        
            }}
            if(oldconlist != Null){
                for(contact c : oldconlist){
                    accountids.add(c.accountid); 
                        }
            }
            list<contact> existingcontact = [select id, accountid, email from contact where accountid IN: accountids];
            map<id, integer> countmap = new map<id, integer>();
            for(id accids : accountids){
                countmap.put(accids, 0);
            }
        for(contact c : existingcontact){
            if(countmap.containskey(c.accountid)){
                countmap.put(c.accountid, countmap.get(c.accountid) + 1);
            }
        }
        list<account> existingaccounts = [select id, name, Contact_count__c from account where Id IN: accountids];
        for (account acc : existingaccounts){
            if(countmap.containskey(acc.id)){
                acc.contact_count__c = countmap.get(acc.id);
               
            }
        }
        if(!existingaccounts.isempty()){
            update existingaccounts;
        }
        
        
        }
        
        
    }