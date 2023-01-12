// public with sharing class test_trigger_task2 {
//     public test_trigger_task2() {

//     }
// }

@isTest
public class test_trigger_task2 {

    static testMethod void test_trigger_task2() {
        Lead lead = new Lead();
       lead.LastName = 'Test';
        lead.Rating = 'Hot';
        insert lead;

        Lead testLead = [SELECT Id, Rating FROM Lead WHERE Id = :lead.Id];
        System.assertEquals('Hot', testLead.Rating);
    }
}