
public with sharing class task4 {
    public String userName {get; set;}
    public List<Customer__c> customerObjList {get; set;}
    public task4() {
        getInput = True;
        customerObjList = new List<Customer__c>();
    }
    public void searchUserName() {
        getInput = False;
        customerObjList = [SELECT Id, UserName__c FROM Customer__c WHERE UserName__c =: userName];
    }
}