// public with sharing class lwc3a_account_list {
   
  
//         @auraEnabled(cacheable=true)
//         public static List<Account> fetchAccount()
//         {
//             List<Account> accList=[SELECT Id,Name FROM Account LIMIT 10000];
//             return accList;
//         }
//         @auraEnabled
//         public static List<Contact> getContacts(String accountId)
//         {
//             List<Contact> conList=[SELECT Id,LastName,AccountId FROM Contact WHERE AccountId=:accountId LIMIT 10000];
//             return conList;
//         }
//         @auraEnabled
//         public static List<Opportunity> fetchOpportunity(String accountId)
//         {
//             List<Opportunity> oppList=[SELECT Id,Name,AccountId FROM Opportunity WHERE AccountId=:accountId LIMIT 10000];
//             return oppList;
//         }  
      
//     }

public with sharing class lwc3a_account_list  {

    @AuraEnabled
        public List<Contact> cntlist;
    @AuraEnabled
        public List<Opportunity> opplist;
    @AuraEnabled
        public boolean showCnt = false;
    @AuraEnabled
        public boolean showOpp = false;

    public lwc3a_account_list() {

    }

    @AuraEnabled(cacheable=true)
    public static Map<Id, String> showAccList() {
        List<Account> acclist = [SELECT Id, Name FROM Account];
        Map<Id, String> accMap = new Map<Id, String>();
        if(acclist.size() != 0) {
            for(Account acc : acclist) {
                accMap.put(acc.Id, acc.Name);
            }
        }
        return accMap;
    }

    @AuraEnabled(cacheable=true)
    public static lwc3a_account_list  showCntOppList(Id accId) {
        lwc3a_account_list pg = new lwc3a_account_list();
        List<Contact> cntlist = [SELECT Id, LastName, FirstName, Email, AccountID FROM Contact WHERE AccountID=:accId];
        List<Opportunity> opplist = [SELECT Id, Name, CloseDate, StageName, AccountID FROM Opportunity WHERE AccountID=:accId];
        if(cntlist.size() != 0){
            .cntlist = cntlist;
            pg.showCnt = true;
        }
        if(opplist.size() != 0){
            pg.opplist = opplist;
            pg.showOpp = true;
        }
        System.debug('pg = '+pg);
       return pg;
    }
}