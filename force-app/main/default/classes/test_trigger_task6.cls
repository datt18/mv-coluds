// public with sharing class test_trigger_task6 {
//     public test_trigger_task6() {

//     }
// }


@isTest
public class test_trigger_task6 {
    static testMethod void test_trigger_task6() {
        // setup data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        Contact testContact = new Contact(LastName = 'Test', AccountId = testAccount.Id);
        insert testContact;

        // make sure the contact was created
        Contact c = [SELECT Id, AccountId FROM Contact LIMIT 1];
        System.assertEquals(testAccount.Id, c.AccountId);

        // update the account
        testAccount.Name = 'Changed Account';
        update testAccount;
    }
}