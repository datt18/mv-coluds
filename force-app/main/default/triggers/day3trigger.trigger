

// trigger day3trigger on risk__c( after update) {
//     List<risk__c> con = [Select Id, total__c , Account.total_amount__c from risk__c WHERE Account.ID!=null AND Id IN:Trigger.New];
//     List<Account> acc = new List<Account>();
//     {
//     for(risk__c s:con) {
//     Account a = new Account();
//     a.Id = s.AcccountId;
//     a.total_amount__c = a.total_amount__c+s.total__c;
//     System.Debug('>>>>'+a.total_amount__c);
//     acc.add(a);
//     }
//     if(acc.size() > 0){
//         update acc;
//     } 
//     }
// }



trigger day3trigger on risk__c(after insert, after update, before delete) {
    Set<Id> accountIds = new Set<Id>();

    List<risk__c> rList = Trigger.isDelete ? Trigger.Old : Trigger.New;
    for (risk__c c : rList) {
        
        if (Trigger.isDelete || Trigger.isInsert || (c.total__c != Trigger.oldMap.get(c.Id).total__c)) {
            accountIds.add(c.try1__c);
        }
    
    
    List<Account> accountToUpdate = [SELECT Id, (SELECT new_amount__c FROM risks__r WHERE 	new_amount__c != null) FROM Account WHERE Id IN :accountIds];
    System.debug(accountToUpdate);
    for (Account acc : accountToUpdate) {
        Decimal total = 0;
        for (risk__c risk : acc.risks__r) {

           
         if (Trigger.isAfter || !Trigger.oldMap.containsKey(c.Id)) {
            total += c.new_amount__c;

        }
        }
        acc.t_amount__c = total; 
    }
    
    update accountToUpdate;
}
}

