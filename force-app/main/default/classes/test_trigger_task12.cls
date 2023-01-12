// public with sharing class test_trigger_task12 {
//     public test_trigger_task12() {

//     }
// }

@isTest
public class test_trigger_task12 {
    static testMethod void test_trigger_task12(){
        Account account = new Account(Name = 'TestAccount');
        insert account;
        Contact contact = new Contact();
        contact.FirstName = 'TestAccount';
         
        insert contact;

        // Verify that the contact was created
        Contact contactVerify = [SELECT Id FROM Contact WHERE FirstName = 'TestAccount'];

        System.assertEquals(contactVerify.Id, contact.Id);

    }

    
}