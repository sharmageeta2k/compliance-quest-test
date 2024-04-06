public with sharing class AccountsControllers {

    @AuraEnabled(cacheable=false)
    public static void updateAccount(Id accountId, Boolean isActive) {
        if (Schema.sObjectType.Account.isUpdateable()) {
            Account acc = new Account(Id = accountId, Actives__c = isActive);
            update acc;
        } 
    }
    
   
}
