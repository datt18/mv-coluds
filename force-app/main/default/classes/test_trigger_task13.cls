// public with sharing class test_trigger_task13 {
//     public test_trigger_task13() {

//     }
// }
@isTest
private class test_trigger_task13 {
    static testmethod void newContactEventTest() {
        Account testAcc = new Account(Name = 'test');
        System.debug(testAcc);
        insert testAcc;
        Contact testContact = new Contact(FirstName = 'Test', LastName = 'Test', AccountId = testAcc.Id);
        System.debug(testContact);
        Test.startTest();
        insert testContact;
        Test.stopTest();
        Event testEvent = [SELECT Subject FROM Event WHERE WhatId = '0015g000016DsgDAAS'];
        System.debug(testEvent);
        System.assertEquals(testEvent.Subject, 'New Contact: Test Test');   
    }
}
