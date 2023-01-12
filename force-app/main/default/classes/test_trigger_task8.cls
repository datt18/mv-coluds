// public with sharing class test_trigger_task8 {
//     public test_trigger_task8() {

//     }
// }


@isTest
private class test_trigger_task8{
    static testMethod void test_trigger_task8(){
        Account acc = new Account();
        acc.Name = 'ABC';
        insert acc;
        acc.Name = 'Ms. ABC';
        update acc;
       
        Account acc1 = new Account();
        acc1.Name = 'XYZ';
        insert acc1;
        acc1.Name = 'Mr. XYZ';
        update acc1;

       
        Account acc2 = new Account();
        acc2.Name = 'PQR';
        insert acc2;
        acc2.Name = 'Mrs. PQR';
        update acc2;
        System.assertEquals('Ms. ABC', acc.Name);
        System.assertEquals('Mr. XYZ', acc1.Name);
        System.assertEquals('Mrs. PQR', acc2.Name);
    }
}