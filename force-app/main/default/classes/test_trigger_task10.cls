
@isTest
public class test_trigger_task10{
	static testMethod void testAccountApproval(){
		//create an Account
		Account acc = new Account(Name='Test Account', 
								  Phone='1234567890',
								  Website='www.test.com');

		//insert the Account
		insert acc;
		
		//query the Account
		Account a = [SELECT Id, Name FROM Account WHERE Name = 'Test Account'];
		//verify the Id
		System.assertEquals(acc.Id, a.Id);
	}
}