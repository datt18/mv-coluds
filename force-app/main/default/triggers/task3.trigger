trigger task3 on Opportunity (before insert,before update) {
    

    if(Trigger.isBefore && Trigger.isInsert){
        for(Opportunity oppObject: Trigger.New){
           oppObject.StageName ='Prospecting';
           oppObject.CloseDate = System.today().addDays(15);
        }
    }
}

// trigger task3 on Opportunity (before update) {
//     for(Opportunity o : Trigger.new){
//         if(o.stageName != Trigger.oldMap.get(o.Id).stageName){
//             o.StageName = 'Prospecting';
//             o.CloseDate = Date.today().addDays(15);
//         }
//     }
// }
