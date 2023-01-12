




// public with sharing class lwc_task4_apex {

   

  
//     @AuraEnabled
//     // public static List<SObject> getObjectRecords(String objectName) {
//     //   return [SELECT Id, Name FROM  objectName];
//     // }
//     public static List<sObject> getObjectRecords(String objectName) {
//                 String query = 'SELECT Name, Email FROM ' + objectName;
               
//                return Database.query(query);    

// // System.debug('query'+query);
//             //    List<sObject> conts=[select id, name FROM objectName];
//             //    return conts;
//             }

    
//     @AuraEnabled
//     public static void sendEmail(String emailSubject, String emailBody, List<Id> selectedId) {
//       List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
//       System.debug('email'+emails);
//       List<String> toAddresses = new List<String>();

//       Set<Id> contactIds = new Set<Id>();

//       System.debug('contactIds');
      
//       System.debug(contactIds);
//       for (Id recordId : selectedId) {
//         List<Contact> contacts = [SELECT Id, Email FROM Contact WHERE Id = :recordId];
//         for (Contact contact : contacts) {
//           contactIds.add(contact.Id);
//           toAddresses.add(contact.Email);
//         }
       
//       }
//        System.debug('contact id'+contactIds);
//         System.debug('toAddresses'+toAddresses);

//       // Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
//       // System.debug('emailtry'+email);

//       // email.setSubject(emailSubject);
//       // email.setHtmlBody(emailBody);
//       // email.setToAddresses(toAddresses);
//       // emails.add(email);

//       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
//         System.debug('emailtry    '+mail);

//     //  String[] to = new String[] {'pateldatt81@gmail.com'};
//    // String[] to = new String[] {toAddresses};


//       mail.setToAddresses(toAddresses);
//       mail.setSubject(emailSubject); 
//       mail.setHtmlBody(emailBody);

//       // mail.setToAddresses(toAddresses);
//       // mail.setSubject('try'); 
//       // mail.setHtmlBody('hello');


    
//       System.debug(emailBody);
//       System.debug(toAddresses);
      
//       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
      
    
//       // System.debug(setSubject); 
//       // System.debug(emailBody);
//       // System.debug(toAddresses);
//     //  Messaging.SendEmailResult[] results = Messaging.sendEmail(emails);
//     // Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email});

//       System.debug(emailSubject);
//       System.debug(emailBody);
//       System.debug(mail);  

//       // Logic to track emails
//     }
//   }




// public with sharing class lwctask4 {
//     public lwctask4() {

//     }
// }

// public with sharing class lwctask4 {
//     @AuraEnabled(cacheable=true)
//     public static List<SObject> getRecords(String objectType) {
//         return [SELECT Id, Name, Email FROM :objectType];
//     }
// }




// public with sharing class lwctask4 {
//     public lwctask4() {

//     }
// }

// public with sharing class lwctask4 {
//     @AuraEnabled(cacheable=true)
//     public static List<SObject> getRecords(String objectType) {
//         return [SELECT Id, Name, Email FROM :objectType];
//     }
// }

public with sharing class lwc_task4_apex {

    @AuraEnabled
        public List<Lead> leadlist;
    @AuraEnabled
        public List<Account> acclist;
    @AuraEnabled
        public List<Contact> cntlist;
    @AuraEnabled
        public List<Id> totelId;
    @AuraEnabled
        public List<String> emails;
    @AuraEnabled
        public List<String> names;

    // public lwc_task4_apex() {

    // }


    @AuraEnabled
    public static lwc_task4_apex recordList(String obj){
        lwc_task4_apex pg = new lwc_task4_apex();
        if(obj == 'Lead'){
            List<Lead> leadlist = [SELECT Id, Email, Name FROM Lead ORDER BY Name];
            if(leadlist.size() != 0){
                pg.leadlist = leadlist;
            }
        }

        if(obj == 'Account'){
            List<Account> acclist = [SELECT Id, acc_Email__c, Name FROM Account ORDER BY Name];
            if(acclist.size() != 0){
                pg.acclist = acclist;
            }
        }

        if(obj == 'Contact'){
            List<Contact> cntlist = [SELECT Id, Email, LastName FROM Contact ORDER BY FirstName];
            if(cntlist.size() != 0){
                pg.cntlist = cntlist;
            }
        }
        return pg;
    }

    @AuraEnabled
    public static lwc_task4_apex Emails(List<Id> leadIds, List<Id> accIds, List<Id> cntIds){
        // Map<String, String> emails = new Map<String, String>();
        lwc_task4_apex pg = new lwc_task4_apex();
        List<Id> Ids = new List<Id>();
        List<String> tname = new List<String>();
        List<String> tmails = new List<String>();
        List<Lead> leadlist = [SELECT Id, Email, Name FROM Lead WHERE Id IN :leadIds];
        List<Account> acclist = [SELECT Id, acc_Email__c, Name FROM Account WHERE Id IN :accIds];
        List<Contact> cntlist = [SELECT Id, Email, LastName FROM Contact WHERE Id IN :cntIds];
        System.debug('leadlist = '+leadlist);
        System.debug('acclist = '+acclist);
        System.debug('cntlist = '+cntlist);
        if(leadlist.size() != 0){
            for(Lead lead : leadlist){
                tmails.add(lead.Email);
                tname.add(lead.Name);
                Ids.add(lead.Id);
            }
        }
        if(acclist.size() != 0){
            for(Account acc : acclist){
                tmails.add(acc.acc_Email__c);
                tname.add(acc.Name);
                Ids.add(acc.Id);
            }
        }
        if(cntlist.size() != 0){
            for(Contact cnt : cntlist){
                tmails.add(cnt.Email);
                tname.add(cnt.LastName);
                Ids.add(cnt.Id);
            }
        }
        // System.debug('emails = '+emails);
        pg.totelId = Ids;
        pg.emails = tmails;
        pg.names = tname;
        return pg;
    }

    @AuraEnabled
    public static void sendEmails(String subject, String body, String name, List<String> emails, List<String> names, List<Id> Ids){
        try {
            List<String> mailId;
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            for(Integer i=0; i<Ids.size(); i++){
                mailId = new List<String>();
            messaging.SingleEmailMessage mail = new messaging.SingleEmailMessage();
            // mail.setTargetObjectId(Ids[i]);
            mail.setSaveAsActivity(false);
            mailId.add(emails[i]);
            mail.setToAddresses(mailId);
         
            mail.setReplyTo('pateldatt81@gmail.com');
            // mail.setSenderDisplayName(name);
            mail.setSubject(subject);
            mail.setHtmlBody('Hello ' +  names + ','+'<br/>'+body);
            // mail.setEntityAttachments(emailDetails.files);
            System.debug('mail = '+mail);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
        } catch (exception e) {
            System.debug('Errors = '+e);
            // ErrorLogsException.showlogs(e);
        }
    }
}