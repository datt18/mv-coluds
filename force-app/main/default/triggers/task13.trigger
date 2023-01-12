
trigger task13 on Contact (after insert) {
    list<Event> co = new list<Event>();

    if(trigger.isafter && trigger.isinsert){      
        
            for(Contact a: trigger.new){
                
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


//   eve.IsAllDayEvent = true;
//     eve.ActivityDate = System.Today();
//     eve.Subject = 'Call';