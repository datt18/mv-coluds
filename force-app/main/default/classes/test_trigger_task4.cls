// public with sharing class test_trigger_task4 {
//     public test_trigger_task4() {

//     }
// }


@isTest
public class test_trigger_task4 {
    static testMethod void test_trigger_task4() {
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;

        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.AccountId = acc.Id;
        opp.StageName = 'Qualification';
        opp.Type = 'New Customer';
        insert opp;

        List<Opportunity> oppList = [SELECT Id, Type FROM Opportunity 
                                     WHERE Id = :opp.Id];
        System.assertEquals('New Customer', oppList[0].Type);
    }
}