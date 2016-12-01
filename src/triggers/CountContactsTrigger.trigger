trigger CountContactsTrigger on Contact (
	before insert, 
	before update, 
	before delete, 
	after insert, 
	after update, 
	after delete, 
	after undelete) 
	{
    	
		if (Trigger.isAfter) 
		{
			if(Trigger.isUpdate)
			{
		    	for (Contact contact : Trigger.new) 
                {
                	Contact oldContact = Trigger.oldMap.get(contact.Id);
                	Id oldAccountId = oldContact.AccountId;
                	Id newAccountId = contact.AccountId;
                		if(oldAccountId != newAccountId)
                    	{
                   			CountContactsController.countContactsByAccount(Trigger.old);
                   			CountContactsController.countContactsByAccount(Trigger.new);
                     	}
                } 
            }
			if(Trigger.isDelete)
            {
	     		CountContactsController.countContactsByAccount(Trigger.old);
         	}
            if(Trigger.isUndelete || Trigger.isInsert)
            {
            	CountContactsController.countContactsByAccount(Trigger.new);  
            }            
		}
	}