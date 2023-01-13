
// @isTest
// public class test_trigger_task12 {
//     static testMethod void test_trigger_task12(){
//         Account account = new Account(Name = 'TestAccount');
//         insert account;
//         Contact contact = new Contact();
//         contact.FirstName = 'TestAccount';
         
//         insert contact;

//         // Verify that the contact was created
//         Contact contactVerify = [SELECT Id FROM Contact WHERE FirstName = 'TestAccount'];

//         System.assertEquals(contactVerify.Id, contact.Id);

//     }

    
// }

@isTest
public class test_trigger_task12 {

    static testMethod void testAccountContactCreation() {
        Account acct = new Account();
        acct.Name='Test Account';
        insert acct;
        Contact cnt = new Contact();
       // FirstName=acct.Name; 
        cnt.LastName = 'Test Account';
        insert cnt;
        // Verify that the contact was created with the same name as the account
        Contact cnt2 = [select Id, Name from Contact where Id =: cnt.Id];
        System.assertEquals('Test Account',cnt2.Name);
    }
}