trigger trigger_handler_account on Account (before insert ,before update,before delete ,
after insert , after update , after delete , after undelete) {

    if(Trigger.isBefore && Trigger.isInsert){
        account_handler_c.task5t(Trigger.New);
        account_handler_c.task8t(Trigger.New);
        account_handler_c.task14t(Trigger.New);
    }
    if(Trigger.isAfter && Trigger.isUpdate || Trigger.isBefore && Trigger.isUpdate){

        account_handler_c.tsak6t(Trigger.New);

    }
    
    // if(Trigger.isBefore && Trigger.isInsert){
    //     account_handler_c.task8t(Trigger.New);       
    // }
   
    if(Trigger.isAfter && Trigger.isUpdate){
        account_handler_c.task11t(Trigger.New);
    }
    if(Trigger.isAfter && Trigger.isInsert){
        account_handler_c.task12t(Trigger.New);
    }
    // if(Trigger.isBefore && Trigger.isInsert){
    //     account_handler_c.task14t(Trigger.New);
    // }

    






}