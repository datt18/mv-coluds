

@isTest
private class test_trigger_task5 {
    static testMethod void test_trigger_task5() {
        Account account = new Account();
        account.Name = 'new';
        account.Ownership = 'Public';
        insert account;
        account = [SELECT Id, Ownership FROM Account WHERE Ownership =: 'Public'];
        System.assertEquals('Public', account.Ownership);
    }
}


// @isTest
// private class test_trigger_task5 {
//     static testMethod void test_trigger_task5(){
//         Account testAccount = new Account(Name='Test Account');
//         testAccount.OwnerId = 'Public';
//         insert testAccount;
//         testAccount = [SELECT Id, OwnerId FROM Account WHERE Id=:testAccount.Id];
//         System.assertEquals('Public', testAccount.OwnerId);
//     }
// }