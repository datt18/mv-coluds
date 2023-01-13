
@isTest
public class test_trigger_task12 {
 
    @isTest
    public static void createContactForAccountTest(){
 
        // Create a new account
        Account acc = new Account();
        acc.Name = 'SampleAccount';
        insert acc;
        System.debug(acc);
 
        // Load the account to get the Id
        Account a = [SELECT Id, Name FROM Account WHERE Name = 'SampleAccount'];
 
        // Create a contact for the account
        Contact con = new Contact();
        con.LastName = a.Name;
        con.AccountId = a.Id;
        insert con;
        System.debug(con);
 
        // Verify that contact is created for the account
//         Contact c = [SELECT Id, LastName, AccountId FROM Contact WHERE AccountId = :a.Id];
// System.debug(c);
        System.assertEquals(con.AccountId, acc.Id);
    }
}