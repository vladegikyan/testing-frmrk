@isTest
private class TestContactHelper {
	
	@isTest static void test_all() {
		
		SObject so = ContactHelper.create();
		system.assertEquals(Contact.sObjectType, so.getsObjectType());

		List<SObject> so_lst = ContactHelper.create(5);
		system.assertEquals(5, so_lst.size());
		//system.assertEquals(Account.sObjectType, so_lst.getSObjectType());

		so = ContactHelper.create('RecordType');
		system.assertEquals(Contact.sObjectType, so.getSObjectType());

		so_lst = ContactHelper.create('RecordType', 5);
		system.assertEquals(5, so_lst.size());

		Account acc = AccountHelper.create();
		acc.Name = 'Account Name';
		insert acc;

		so = ContactHelper.create(acc);
		system.assertEquals(acc.Id, so.get('AccountId'));

		so_lst = ContactHelper.create(acc, 5);
		system.assertEquals(5, so_lst.size());
		for(Contact con : (List<Contact>) so_lst) {
			system.assertEquals(acc.Id, con.AccountId);
		}
	}
}