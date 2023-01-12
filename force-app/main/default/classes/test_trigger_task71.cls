@isTest
public class test_trigger_task71 {
    static testMethod void testOpportunityNameChangeTrigger() {
        Opportunity opp = new Opportunity();
        opp.Name = 'Test Opportunity';
        opp.StageName = 'Prospecting';
        insert opp;

        // Change the Opportunity Name
        opp.Name = 'Updated Opportunity Name';
        update opp;

        // Verify a task has been created
        List<Task> tasks = [SELECT Id FROM Task];
        System.assertEquals(1, tasks.size());
    }
}