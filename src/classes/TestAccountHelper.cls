@isTest
private class TestAccountHelper {
	
	@isTest static void test_all() {
		
		SObject so = AccountHelper.create();
		system.assertEquals(Account.sObjectType, so.getsObjectType());

		List<SObject> so_lst = AccountHelper.create(5);
		system.assertEquals(5, so_lst.size());
	}
}