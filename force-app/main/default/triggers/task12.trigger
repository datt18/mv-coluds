
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
    List<Contact> contactsToInsert = new List<Contact>(); 
    for(Account acc : Trigger.new){
        Contact con = new Contact(FirstName=acc.Name, AccountId = acc.Id);
        contactsToInsert.add(con);
    }
    if(contactsToInsert.size() > 0){
        insert contactsToInsert;
    }
}
