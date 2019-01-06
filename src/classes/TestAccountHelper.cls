@isTest
private class TestAccountHelper {
	
	@isTest static void test_all() {
		
		SObject so = AccountHelper.create();
		system.assertEquals(Account.sObjectType, so.getsObjectType());

		List<SObject> so_lst = AccountHelper.create(5);
		system.assertEquals(5, so_lst.size());
		//system.assertEquals(Account.sObjectType, so_lst.getSObjectType());

		so = AccountHelper.create('RecordType');
		system.assertEquals(Account.sObjectType, so.getSObjectType());

		so_lst = AccountHelper.create('RecordType', 5);
		system.assertEquals(5, so_lst.size());
	}
}