trigger trigger_handler_oppo on Opportunity ( before update,before delete ,
after insert , after update , after delete , after undelete
)


{

    if(Trigger.isBefore && Trigger.isInsert){
        oppo_handler.task3t(Trigger.New);
        oppo_handler.task4t(Trigger.New);

    }
    // if(Trigger.isBefore && Trigger.isInsert){
       
    // }

   if(Trigger.isUpdate && Trigger.isInsert){

    oppo_handler.task7t(Trigger.New);

   }

  if(Trigger.isUpdate){
    oppo_handler.task10t(Trigger.New);
  }



}