global class day3_batchclass_task1 implements Database.Batchable <SObject>{
    global Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT name from Account');
    }
    global void execute(Database.BatchableContext bc, List<Account> acList){
       for(Account ac :acList){
          ac.name = ac.name+' - batch update';   
       }
       update acList;
   }
    global void finish(Database.BatchableContext bc){
        System.debug('test succc...');

        day3_batchclass_task2  hii = new day3_batchclass_task2();
        Database.executeBatch(hii);
        

        
    }
}




// global class day3_batchclass_task1 implements database.Batchable<Sobject> {

//     global Database.QueryLocator start(database.BatchableContext bc)
//     {
//         String query= 'select id, Name from Account';
//         return Database.getQueryLocator(query);
//     }
//     global void execute(database.BatchableContext bc,List<Account> acclist)
//     {
//         // List<Account> acc = new List<Account>();
//         for(Account a: acclist)
//         {
//             a.Name ='batchclass' +a.Name;
//             // acc.add(a);
//         }
//         update acclist;
//     }
//         global void finish(database.BatchableContext bc){

//             //call this 
           
//             day3_batchclass_task2  b = new day3_batchclass_task2();
//             Database.executeBatch(b , 200);

//         } 
// }










// query that add 10000 records in account
// list<Account> acc = new list <Account>();
// for(Integer i=0;i<2000;i++){
//     Account a = new Account (Name ='dattpatel');
// acc.add(a);
// }
// insert acc;

