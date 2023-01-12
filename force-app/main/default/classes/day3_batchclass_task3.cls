
// global class day3_batchclass_task3 implements Database.Batchable<sObject>
// {
//     global Database.QueryLocator start(Database.BatchableContext BC)
//     {
//         String query = 'Select Id, Name, OwnerId from Account ';
// System.debug(query);
//         return Database.getQueryLocator(query);
//     }
 
//     global void execute(Database.BatchableContext BC, List<Account> scope)
//     {       
//         // EmailTemplate emailTemplate = [select Id, Body from EmailTemplate where Name = 'Datt patel'];
        
//         for(Account ta : (List<Account>)scope) {
//             Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
//             email.setToAddresses(new String[] {ta.Owner.Email});
//             email.setSaveAsActivity(false);
//             email.setTargetObjectId(ta.OwnerId);
//             email.setTemplateId(emailTemplate.Id);
//             email.setWhatId(ta.Id);
//             Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
//         }
//     }  
//     global void finish(Database.BatchableContext BC)
//     {
//     }
// }

global class day3_batchclass_task3 implements Database.Batchable<sobject>,Database.Stateful{
    public Map<Id,List<String>> accMap;
    global day3_batchclass_task3(){
        accMap=new Map<Id,List<String>>();
    }
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query='Select id,name,ownerId from Account';
        return Database.getQueryLocator(query);
    
    }
    
    global void execute(Database.BatchableContext bc,List<Account> scope){
        for(Account a:scope){
            if(accMap.containsKey(a.ownerId)){
                List<String> names=accMap.get(a.ownerId);
                names.add(a.name);
                accMap.put(a.ownerId,names);
        //    System.debug(accMap);
            }else{
                List<String> names=new List<String>();
                names.add(a.name);
                accMap.put(a.ownerId,names);
                System.debug(a.OwnerId+'usermap');
                System.debug('try2'+names);

            }
        }   
    }
    global void finish(Database.BatchableContext bc){
        Set<Id> keys=accMap.keySet();
        List<User> users=[Select id,email from user where id in:keys];
        Map<Id,String> userMap=new Map<Id,String>();
        System.debug(userMap+'usermap');
        for(User u:users){
            userMap.put(u.id,u.email);
            System.debug(userMap+'usermap123');

        }
        System.debug('userMap===========>'+userMap);
        List<Messaging.Email> emails=new List<Messaging.Email>();
        for(Id k:keys){
            Messaging.SingleEmailMessage msg=new Messaging.SingleEmailMessage();
            List<String> accounts=accMap.get(k);
            String body='';
            for(String a:accounts){
                body=body+'<br/>'+a;
            }
            msg.setSubject('Your Accounts');
            msg.setHtmlBody(body);
            String email=userMap.get(k);
            String[] toadd=new String[]{email};
                msg.setToAddresses(toadd);
            emails.add(msg);
            System.debug(email);
        }
        Messaging.sendEmail(emails);
    }
}
