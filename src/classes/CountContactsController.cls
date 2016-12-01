public with sharing class CountContactsController 
{
	public static void countContactsByAccount(List<Contact> contacts)
	{
    Set<Id> accountIds = new Set<Id>();
    Integer i = 0;
    List<Id> listId = new List<Id>();
    List <Account> updateAccount = new List <Account>();
      for(Contact contact : contacts)
    	{ 
      	if(contact.AccountId != null){
        	accountIds.add(contact.AccountId); 
      	}
    	}      
      	listId.addAll(accountIds);
 	    	List<AggregateResult> result = [select count(id) from Contact where AccountId  in : accountIds];     
        	for(AggregateResult count : result )
            {
     		   		Account account = new Account();
           		account.id = listId.get(i);
        			account.NumberOfContact__c = Integer.valueOf(count.get('expr0'));
            	updateAccount.add(account);
     		     	i++;	
      			}
  	update updateAccount;
  }
}