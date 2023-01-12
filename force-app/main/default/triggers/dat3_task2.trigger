// trigger dat3_task2 on Contact (before insert,after update) {
//     // dat3_task2.sheep_problem(trigger.old,trigger.new[0],trigger.old[0]);
//     trigger_day3_task2.task123(trigger.old,trigger.new[0],trigger.old[0]);
//     }

trigger dat3_task2 on Contact (after update) {
    trigger_day3_task2.trigger_day3_task2(trigger.old,Trigger.new[0],Trigger.old[0]);
}





