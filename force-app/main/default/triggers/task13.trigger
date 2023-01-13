
// trigger task13 on Contact (after insert) {
//     list<Event> co = new list<Event>();

//     if(trigger.isafter && trigger.isinsert){      
        
//             for(Contact a: trigger.new){
                
//                 Event c = new Event();
//                 c.WhoId = a.Id;
//                 c.IsAllDayEvent = true;
//                 c.ActivityDate = System.Today();
//                 c.Subject = 'Call';
//                 // c.OwnerId = a.Id;
//                 co.add(c);
//             }  
    
//             insert co; 
                 
//     }
//   }


trigger task13 on Contact (before Insert) {
  List<Event> events = new List<Event>();
  for (Contact c : Trigger.new) {
      Event e = new Event();
      e.Subject = 'New Contact: ' + c.Name;
      e.StartDateTime = System.Now();
      e.EndDateTime = System.Now().addHours(1);
      e.WhatId = c.Id;
      events.add(e);
  }
  insert events;
}
