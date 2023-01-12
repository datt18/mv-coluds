public with sharing class account_handler_c {

    public account_handler_c(){

    }

// task5 related handler class
  
     public static void task5t(List<Account> a){
        for(Account act :  a){
            act.Ownership = 'Public';
        }
     }
// task6 related handler class
     public static void tsak6t(List<Account> b){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Set<Id> setAccountIds = new Set<Id>();
        List<String> sendTo = new List<String>();
        List<Contact> con = new List<Contact>();
        List<Account> Name = new List<Account>();
        
        for(Account acc : b){
            if(acc.Name != null){
                setAccountIds.add(acc.Id);
                System.debug('setAccountIds::' + setAccountIds);
            }
        }
    
        if(!setAccountIds.isEmpty()) {
            for(Contact c : [SELECT Name,Email FROM Contact WHERE AccountId IN:setAccountIds]){
                if(string.IsNotBlank(c.Email)){
                    sendTo.add(c.Email);
    
                }
            }
        }
    
        if(!sendTo.isEmpty()){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSenderDisplayName('Email Alert');
    
            mail.setSubject('Account Name change');
            String body = 'Dear Employee Account Name is change.';
            mail.setToAddresses(sendTo);
            mail.setHtmlBody(body);
            mails.add(mail);
            
                Messaging.SendEmail(mails);
                
            
        }

     }


// task 8 related trigger hendler class     
    public static void task8t(List<Account> c){
            for(Account acc : c){
                 acc.Name = 'Mr.'+acc.Name;
         }
}

// task 11related handler class
public static void task11t(List<Account> d){
    Account before = d[0];
    // Account after = Trigger.new[0];
    Account accafter = [SELECT Rating, Id FROM Account WHERE Id=: before.Id];
    if(before.Rating != 'Hot'){
        if(accafter.Rating.equals('Hot')){
            System.debug('1234');
            AccountShare a = new AccountShare();
            // user name datt11 in my addmin section 
            a.UserOrGroupID = '0015g00000ztnKtAAI';
            a.AccountId = accafter.Id;
            a.AccountaccessLevel = 'Edit';
            a.OpportunityAccessLevel = 'Read';
            // a.ContactAccessLevel = 'Read';
            // a.CaseAccessLevel = '';
            insert a;
        }
    }
}

// task 12 task  related class

public static void task12t(List<Account> e){
    if(trigger.isafter && trigger.isinsert){      
        
        list<contact> conList = new list<contact>();
        
            for(Account a: e){
                
                contact c = new contact();
                c.LastName = a.Name;
                c.AccountId = a.Id;
                conList.add(c);
            }  
        if(conList.size()>0)
            insert conList;     
    }
}
// task 12 task  related class
public static void task14t(List<Account> f){
    List<String> myyname = new List<String>();
    List <Account> accountlist = new List<Account>();
    for(Account a: f){
        myyname.add(a.name);
    }
    accountlist =[select id,name from Account where name in : myyname];
    if(accountlist != null ){
        delete accountlist;
    }
    

}



}
