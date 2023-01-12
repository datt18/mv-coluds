
// trigger task9 on Contact (after delete) {
//     List<Id> accId = new List<Id>();
//     for(Contact c : Trigger.old){
//         accId.add(c.AccountId);
//     }
//     List<Account> accdelete = [select Id from Account where Id IN :accId];
//     if(accdelete.size() > 0){
//     	delete accdelete;
//     }
// }


trigger task9 on Contact (after delete) {
    Set<Id> accountIds = new Set<Id>();
    
    for(Contact con : Trigger.old)
    {
        accountIds.add(con.AccountId);
    }
    
    List<Account> accountsToDelete = [SELECT Id FROM Account WHERE Id IN :accountIds];
    
    if(accountsToDelete.size() > 0)
    {
        delete accountsToDelete;
    }
}