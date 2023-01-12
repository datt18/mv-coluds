



// trigger task7 on Opportunity (after insert,after update) {
//     List<task> carry=New List<task>();
    
//       for(opportunity opp:trigger.new){
//        if(opp.stagename=='Closed Won'){
//         task t=new task(
//             whatid=opp.id, 
//             Status = 'Active',
//             Subject = 'Follow Up Test Task',
           
//             ActivityDate = system.today()
//          );
//         carry.add(t); 
//         }
//        }
//          insert carry;
    
//      }


trigger OpportunityNameChange on Opportunity (before update) {
  List<Task> tasksToCreate = new List<Task>();

  for(Opportunity opp : Trigger.new) {
      if(opp.Name != Trigger.oldMap.get(opp.Id).Name) {
          Task t = new Task();
          t.OwnerId = opp.OwnerId;
          t.Subject = 'Opportunity Name Changed';
          t.Description = 'Opportunity Name changed from ' + Trigger.oldMap.get(opp.Id).Name +
                          ' to ' + opp.Name;
          tasksToCreate.add(t);
      }
  }
  if(tasksToCreate.size() > 0) {
      insert tasksToCreate;
  }
}