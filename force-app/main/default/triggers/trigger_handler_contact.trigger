trigger trigger_handler_contact on Contact (after insert , after delete ) {

    if(Trigger.isBefore && Trigger.isInsert){
        contact_handler_c.task9t(Trigger.New);
    }
    
    if(Trigger.isBefore && Trigger.isInsert){
        contact_handler_c.task13t(Trigger.New);
    }


}