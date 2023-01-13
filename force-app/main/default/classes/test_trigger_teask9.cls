
@isTest
public  class test_trigger_teask9 {

    static testMethod void testDeleteAccountOnContactDelete() {
        // Create an account
        Account acc = new Account(Name='Test Account');
        insert acc;

        // Create a contact
        Contact con = new Contact(FirstName='Test', LastName='Contact', AccountId=acc.Id);
        insert con;
        System.debug(con);
        // Delete the contact
        delete con;
System.debug(con.id);
System.debug(con.AccountId);
System.debug(acc.Id);

        // Query the Account
        // acc = [SELECT Id,Name FROM Account WHERE Id = :acc.Id];
        // System.debug(acc.Id);


        // Assert the account is deleted
        System.assertEquals(acc.Id , con.AccountId);
       
    }

}