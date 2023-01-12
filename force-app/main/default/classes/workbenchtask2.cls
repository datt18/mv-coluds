

// global class workbenchtask2 implements Database.Batchable <SObject>{

// global Database.QueryLocator start(Database.BatchableContext jobId) {

//     Integer[] counts = new Integer[] {};
//     for(Integer i=1;i<=200;i++) counts.add(i);
//     return counts;
// }

// global void execute(Database.BatchableContext jobId, Integer[] counts) {

//     Account[] accs = new Acccount[] {};
//     for (Integer count : counts) {
//         accs.add(new Account(Name='TestMebyClass'+count));
//     }
//     insert accs;

//     Opportunity[] accs = new Opportunity[] {};
//     for(Account a : accs){
//         for(Integer i=1;i<=200;i++){
//             opps.add(new Opportunity(
//                 Name='TestofParentAcc'+i,
//                 StageName='Prospecting',
//                 CloseDate=System.today().addmonths(1),
//                 AccountId=a.Id
//             ));
//         }
//     }
//     insert opps;
// }

// global void finish(Database.BatchableContext jobId) {
// }}

global class workbenchtask2 implements Database.Batchable<sObject> {
    global List<Account> start(Database.BatchableContext BC) {
    
    List<Account> AccList= new List<Account>();

    for(Integer i=0;i<500;i++) // 500000
    {
    account ac= new account();
    ac.Name='Batch'+i;
    AccList.add(ac);
    System.debug('hiii'+AccList);
    }
    String query = 'SELECT Id, Name FROM Account';
    return AccList;
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
    
    
    try {
    if(accList.size()>0)
    {
    Insert accList;
    System.debug('hiii123'+AccList);

    }
    
    } catch(Exception e) {
    System.debug(e);
    }
    System.debug('hiii0000'+AccList);
    
}
    
    global void finish(Database.BatchableContext BC) {
    // execute any post-processing operations like sending email
    }
    }
