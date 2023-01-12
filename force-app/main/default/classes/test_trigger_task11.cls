@isTest
public with sharing class test_trigger_task11 {
   
    static testMethod void test_trigger_task11() {
        Account a = new Account();
        a.Name = 'test account';
        a.Rating = 'Hot';

        insert a;
         
        a = [SELECT Id, Name, Rating FROM Account WHERE Rating = 'Hot' ];
        System.assertEquals('Hot', a.Rating);




    }
}

