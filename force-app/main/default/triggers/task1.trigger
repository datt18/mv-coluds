trigger task1 on Account (before insert ,before update,before delete ,
after insert , after update , after delete , after undelete ) {
    if (trigger.isBefore) {
        if(trigger.isInsert){
            System.debug('before insert ');
        }
        else if(trigger.isUpdate){
            System.debug('before update ');
            
        }
        else if(trigger.isDelete){
            System.debug('before delete ');
            
        }



        System.debug('before trigger');
        System.debug('before new'+trigger.new);
        System.debug('before old'+trigger.old);
        System.debug('before oldMap'+trigger.oldMap);
        System.debug('before NewMap'+trigger.newMap);

        

    }
    else if(trigger.isAfter) {
        if(trigger.isInsert){
            System.debug('After insert ');
        }
        else if(trigger.isUpdate){
            System.debug('After update ');
            
        }
        else if(trigger.isDelete){
            System.debug('After delete ');
            
        }
        System.debug('After trigger');
        System.debug('After new'+trigger.new);
        System.debug('After old'+trigger.old);
        System.debug('After oldMap'+trigger.oldMap);
        System.debug('After NewMap'+trigger.newMap);
    }

}