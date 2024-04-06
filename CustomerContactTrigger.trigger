trigger CustomerContactTrigger on Account (before insert) {
    List<Contact> newContacts = new List<Contact>();
    for (Account acc : Trigger.new) {
        if (acc.Acc_Type__c != null && acc.Acc_Type__c.equals('Customer') && acc.Actives__c && (Trigger.isInsert || (Trigger.isUpdate))) {
            Contact defaultContact = new Contact();
            defaultContact.FirstName = acc.Name;
            defaultContact.LastName ='Customer Representative';
            defaultContact.AccountId = acc.Id;
            defaultContact.Email = acc.Email__c;
            defaultContact.Phone = acc.Phone;
            newContacts.add(defaultContact);
        }
    }
    
    if (!newContacts.isEmpty()) {
        insert newContacts;
    }
}