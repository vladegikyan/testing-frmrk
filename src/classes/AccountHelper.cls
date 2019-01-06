// initialize required fields here
// use this class everywhere creating Account instance,
// so you will avoid modifing lots of code, after creating new
// required field or validation rule
@isTest
public with sharing class AccountHelper {
	
	public static IsObjectCreator creator;

	// init the creator only if it is null
	static {
		if(creator == null) {
			creator = ObjectFactory.init('Account');
		}
	}

	public static Account create() {
		Account acc = (Account) creator.createSO();
		// assign required fields
		return acc;
	}

	public static List<Account> create(Integer num) {
		List<Account> lst_acc = (List<Account>) creator.createSO(num);
		// assign required fields
		return lst_acc;
	}

	public static Account create(String recordType) {
		Account acc = (Account) creator.createSO(recordType);
		return acc;
	}

	public static List<Account> create(String recordType, Integer num) {
		List<Account> lst_acc = (List<Account>) creator.createSO(recordType, num);
		// assign required fields
		return lst_acc;
	}
}