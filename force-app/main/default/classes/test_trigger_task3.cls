// public with sharing class test_trigger_task3 {
//     public test_trigger_task3() {

//     }
// }
@isTest
public class test_trigger_task3 {
    
    static testMethod void testOpportunityTrigger() {
        // Create Test Account
        Account a = new Account(Name='TestAccount');
        insert a;

        // Create Test Opportunity
        Opportunity o = new Opportunity(
            Name='TestOpportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(15),
            AccountId = a.Id
        );
        insert o;

        // Update Opportunity
        o.Name = 'UpdatedTestOpportunity';
        update o;

        // Assert that StageName is Prospecting and CloseDate is 15 days from today
        o = [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE Id =: o.Id];
        System.assertEquals('Prospecting', o.StageName);
        System.assertEquals(Date.today().addDays(15), o.CloseDate);
    }
}