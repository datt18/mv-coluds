

@isTest
public class test_trigger_teask9 {
    static testMethod void testDelete(){
        Account acc = new Account(Name = 'Test Account');
        insert acc; 
        Contact con = new Contact(LastName = 'Test', AccountId = acc.Id);
        insert con;
        
        Test.startTest();
        delete con;
        // Test.stopTest();
        
        Account accountCheck = [SELECT Id FROM Account WHERE Id = :acc.Id];
     System.assertEquals(null, accountCheck);
    }
}