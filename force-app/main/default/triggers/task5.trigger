trigger task5 on Account (before insert) {
   
        if(Trigger.isBefore && Trigger.isInsert){
            for(Account account :  Trigger.New){
                account.Ownership = 'Public';
            }
        }
    }
