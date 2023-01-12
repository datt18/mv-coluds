public with sharing class  trigger_day3_task2{
    public static void trigger_day3_task2(list<contact> all,Contact a,Contact b) {
        // Contact af = Trigger.new[0];
        System.debug('New Account :- '+a.AccountId);
        // Contact be = Trigger.old[0];
        System.debug('Old Accont  :- '+b.AccountId);
        // list<account> Acc_list = new list<account>();
        // list<contact> Con_list = new list<contact>();
        set<id> accIds = new set<id>();
        for(contact con : all){
            if(con.accountid != null){
                accIds.add(con.accountid);
            }

        }

        System.debug('Old id acc list :- '+ accIds);
        list<Contact> lstAccs = [Select Id,Name  From Contact where AccountId IN: accIds];
        System.debug('hello Old id acc list :- '+ lstAccs);
        if(!lstAccs.isEmpty()){
            for(contact acc :lstAccs){
                
                
                acc.accountid=a.accountid;
                // Con_list.add(acc);
            }
        }

        if(!lstAccs.isEmpty()){
            update lstAccs;
        }

    }
}






// public with sharing class trigger_day3_task2 {
//     // public trigger_day3_task2() {
//     // }
//     public static void task123(test,test1,test2){

    
//     List<Contact> lstofcont = test;
//     // List<Contact> a = test2;
//     // List<Contact> a = test;

//     Contact a = test1;
//     System.debug(a);
//     Contact b = test2;
//     System.debug(b.AccountId);
//     List<Account> acc_list =  new List<Account>();
//     List<Contact> con_list =  new List<Contact>();
//     set <id> accids = new Set<Id>();
//     for(Contact con : lstofcont){
//         if(con.AccountId != null){
//             accids.add(con.AccountId);
//         }

//     }
//     System.debug('old id '+ accids);
//     list<Contact> www = [select Id,name from Contact where  AccountId in : accids];
//     System.debug('old list '+ www);
//     if(!www.isEmpty()){
//         for(contact acc : opp){
//             // acc.AccountId = a.Id;
//             // con_list.add(acc);

//         }
//     }
//     if(!www.isEmpty()){
//         update www;

// }
// }
// }