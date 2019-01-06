@isTest
public with sharing class ContactHelper {
	
	public static IsObjectCreator creator;

	// init the creator only if it is null
	static {
		if(creator == null) {
			creator = ObjectFactory.init('Contact');
		}
	}

	public static Contact create() {
		Contact con = (Contact) creator.createSO();
		// assign required fields
		return con;
	}

	public static List<Contact> create(Integer num) {
		List<Contact> lst_con = (List<Contact>) creator.createSO(num);
		// assign required fields
		return lst_con;
	}

	/**
	* Create contact related to account
	* @param Account master to assign as parent Account
	* @return Contact with AccountId = master.Id
	*/
	public static Contact create(Account master) {
		Contact con = (Contact) creator.createSO();
		con.AccountId = master.Id;
		return con;
	}

	/**
	* Create contact related to account
	* @param Account master to assign as parent Account
	* @param Integer num number of contacts to create
	* @return Contact with AccountId = master.Id
	*/
	public static List<Contact> create(Account master, Integer num) {
		List<Contact> lst_con = (List<Contact>) creator.createSO(num);
		for(Contact con : lst_con) {
			con.AccountId = master.Id;
		}
		return lst_con;
	}
}