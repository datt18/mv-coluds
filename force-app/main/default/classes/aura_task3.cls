// public with sharing class auraTask3 {
//     public auraTask3() {

//     }
// }
// public class auraTask3 {
//     @AuraEnabled
//     public static string save(Account accountData ,Contact contactData,Opportunity opportunityData){
//         try{
//             System.debug('accountData::::'+accountData);
//             System.debug('contactData::::'+contactData);
//             System.debug('opportunityData::::'+opportunityData);
            
//             insert accountData;
//             contactData.AccountId = accountData.id;
//             insert contactData;
//             opportunityData.AccountId = accountData.id;
//             insert opportunityData;
//         }
//         catch(Exception ex){
//             return ex.getMessage();
//         }
//         return 'record successfully insert';  
//     }
// }

public with sharing class aura_task3 {

    public aura_task3() {

    }

    @AuraEnabled
    public static string createAcc(Account accountData) {
        try{
            System.debug('accountData::::'+accountData);
            insert accountData;

        }
        catch(Exception e){
            System.debug('Errors = '+e);
            // ErrorLogsException.showlogs(e);
            return e.getMessage();
        }
        return 'Account successfully created';
    }

    @AuraEnabled
    public static string createCnt(Account accountData, Contact contactData) {
        try{
            Account acc = [SELECT Id FROM Account WHERE Name=:accountData.Name];
            contactData.AccountId = acc.Id;
            System.debug('contactData = '+contactData);
            insert contactData;
        }
        catch(Exception e){
            System.debug('Errors = '+e);
            // ErrorLogsException.showlogs(e);
            return e.getMessage();
        }
        return 'Contact successfully created';
    }

    @AuraEnabled
    public static List<User> userList() {
        try{
            List<User> us = [SELECT Id, Name, IsActive FROM User WHERE IsActive=true];
            return us;
        }
        catch(Exception e){
            System.debug('Errors = '+e);
            // ErrorLogsException.showlogs(e);
            return null;
        }
    }

    @AuraEnabled
    public static string createEvent(Event eventData, Contact contactData, Account accountData) {
        try{
            insert accountData;
            Account acc = [SELECT Id FROM Account WHERE Name=:accountData.Name];
            if(acc != null){
                contactData.AccountId = acc.Id;
                insert contactData;
            }
            Contact cnt = [SELECT Id, AccountId FROM Contact WHERE LastName=:contactData.LastName];
            if(cnt != null){
                eventData.WhatId = cnt.AccountId;
                eventData.WhoId = cnt.Id;
                insert eventData;
                System.debug('contactData = '+contactData);
            }
            System.debug('eventData::::'+eventData);

        }
        catch(Exception e){
            System.debug('Errors = '+e);
            // ErrorLogsException.showlogs(e);
            return e.getMessage();
        }
        return 'Event successfully created';
    }
}



//   public class aura_task3 {

   
//         @AuraEnabled
//         public static string save(Account accountData ,Contact contactData,Opportunity opportunityData){
//             try{
//                 System.debug('accountData::::'+accountData);
//                 System.debug('contactData::::'+contactData);
//                 System.debug('opportunityData::::'+opportunityData);
                
//                 insert accountData;
//                 contactData.AccountId = accountData.id;
//                 insert contactData;
//                 opportunityData.AccountId = accountData.id;
//                 insert opportunityData;
//             }
//             catch(Exception ex){
//                 return ex.getMessage();
//             }
//             return 'record successfully insert';  
//         }
//     }
  