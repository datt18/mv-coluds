

trigger task4  on Opportunity (before insert) {

    if(Trigger.isBefore && Trigger.isInsert){

        for(Opportunity re: Trigger.New){

           re.Type = 'New Customer';

        }
    }
}

