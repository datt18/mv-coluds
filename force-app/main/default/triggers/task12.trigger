
// trigger task12 on Account (after insert) {

//     if(trigger.isafter && trigger.isinsert){      
        
//         list<contact> conList = new list<contact>();
        
//             for(Account a: trigger.new){
                
//                 contact c = new contact();
//                 c.LastName = a.Name;
//                 c.AccountId = a.Id;
//                 conList.add(c);
//             }  
//         if(conList.size()>0)
//             insert conList;     
//     }
//   }

trigger task12 on Account (after insert) { 
    List<Contact> contactList = new List<Contact>(); 

    for(Account a : Trigger.new) { 
        Contact c = new Contact(); 
        c.FirstName = a.Name; 
        c.LastName = a.Name;
        c.AccountId = a.Id; 
        contactList.add(c); 
    } 

    if(contactList.size() > 0) { 
        insert contactList; 
    } 
}
