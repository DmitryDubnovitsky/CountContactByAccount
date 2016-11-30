public with sharing class CountContactsController 
{
	public static void getCountContactsByAccount()
	{
	    List<Contact> contacts = Trigger.isDelete ? Trigger.old : Trigger.new;
            Account a = new Account();
            List<AggregateResult> count;
                for(Contact contact: contacts)
                {
                   if(contact.AccountId != null)
                   {
                      count = [select count(id) from Contact where AccountId = :contact.AccountId];
                      a.id = contact.AccountId;
                      a.NumberOfContact__c = Integer.valueOf(count[0].get('expr0'));
                    }            
	           }
	           update a;
    }
}