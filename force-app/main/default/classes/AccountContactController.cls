public with sharing class AccountContactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(Id accountId){
        return [SELECT Id, Name, Email, Phone, Title FROM Contact WHERE AccountId=:accountId ORDER BY Name];
    }

}