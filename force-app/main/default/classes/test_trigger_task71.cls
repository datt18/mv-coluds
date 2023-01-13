
@isTest
private class test_trigger_task71 {
    static testmethod void testOpportunityNameModify(){
        //Create Opportunity
        Opportunity o = new Opportunity();
        

        //Retrieve Opportunity
        List<Opportunity> oppList = [SELECT Id, Name from Opportunity WHERE Id = :o.Id];

        System.assertEquals(1, oppList.size());

        //Update Opportunity
        oppList[0].Name = 'TestOppNameModified';
        update oppList;

        //Retrieve Task
        List<Task> tasksList = [SELECT Id, WhatId, Subject, Description FROM Task WHERE WhatId = :oppList[0].Id];

        System.assertEquals(1, tasksList.size());
        System.assertEquals(oppList[0].Id, tasksList[0].WhatId);
        System.assertEquals('Opportunity Name Modified', tasksList[0].Subject);
        System.assertEquals('Opportunity Name has been modified', tasksList[0].Description);
    }
}