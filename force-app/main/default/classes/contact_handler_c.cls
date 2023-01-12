public with sharing class contact_handler_c {

    public contact_handler_c(){

    }


    public static void task9t(List<Contact> a){
        List<Id> accId = new List<Id>();
        for(Contact c : a){
            accId.add(c.AccountId);
        }
        List<Account> accdelete = [select Id from Account where Id IN :accId];
        if(accdelete.size() > 0){
            delete accdelete;
        }

    }
    public static void task13t(List<Contact> b){
        list<Event> co = new list<Event>();

        for(Contact a: b){
                
            Event c = new Event();
            c.WhoId = a.Id;
            c.IsAllDayEvent = true;
            c.ActivityDate = System.Today();
            c.Subject = 'Call';
            // c.OwnerId = a.Id;
            co.add(c);
        }  

        insert co; 

    }
 
}
