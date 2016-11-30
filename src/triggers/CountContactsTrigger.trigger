trigger CountContactsTrigger on Contact (
	before insert, 
	before update, 
	before delete, 
	after insert, 
	after update, 
	after delete, 
	after undelete) {

		if (Trigger.isBefore) 
		{
	    	
	    
		} else if (Trigger.isAfter) 
		{
	    	CountContactsController.getCountContactsByAccount();
	    
		}
}