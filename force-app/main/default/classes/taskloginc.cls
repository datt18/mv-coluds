public with sharing class taskloginc
{
//     public List<Contact> Contacts { get; set; }
//     public List<Opportunity> opportunities {get;set;}
//     public String name { get; set; }
//    public String password { get; set; }
//    public list<contact> conlst { get; set; }
//    public Id getId{get;set;}
    
//    public list<Contact> con1 { get; set; }
//    public list<Contact> c1 { get; set; }
//    public list<Opportunity> o1 { get; set; }
//     public list<account> accconts1 { get; set; }
//     public List<Account> acclst { get; set; }
//       List<Contact> acc = new List<Contact>();
//       List<Contact> i = new List<Contact>();
   
 

//     public taskloginc()
//     {
//         acc=[SELECT password__c, Name  FROM Contact];
//         Contacts = new List<Contact>();
//         opportunities = new List<Opportunity>();

//         acclst=[select id,name  from account];
     
//         // password__c = new List<Account>();

//     }
 
//     public PageReference searchre()
//     {
       
//         for(Contact i : acc){
//             if(name == i.Name && password == i.password__c){
//                 System.debug('ggfffg');
//                 System.debug('ggfffg' + i.id);
//                 getId=i.Id;
//                 System.debug(getId);
//                 con1=[Select id , name  , AccountId , Account.name , (select Id , name from Opportunities )from Contact where Id=:getid];
//                 System.debug(con1);
//                 c1= [Select Id, AccountId , Account.name,FirstName, LastName,Title,Email from Contact where Id=:getid];
//                 System.debug(c1);
//                 o1 = [Select Id,AccountId , Account.name,CloseDate,Amount,StageName,Name from Opportunity where Id=:getid ];

//                 System.debug(con1);

              
//                  System.debug(getId);
              
//             return goToPageTwo();
                   
//             }
           
//         }
//         return null;
//         //return Page.dashboardp;
       
    
//     }

    public List<Contact> getContacts() {
        List<Contact> conresults = [Select Id, FirstName, LastName,Title,Email from Contact where accountid='0015g000012b9tJAAQ'];
        System.debug(conresults);
        return conresults;
        }
        public List<Opportunity> getOpportunities() {
        List<Opportunity> oppresults = [Select Id,CloseDate,Amount,StageName,Name from Opportunity where accountid='0015g000012b9tJAAQ'];
        System.debug(oppresults);
        return oppresults;
        }
  

    // public PageReference goToPageTwo(){
    //     // con1=[Select id , name  , AccountId , Account.name , (select Id , name from Opportunities )from Contact where Id=:getid];
    //         System.debug(con1);
    //     Pagereference p = new PageReference('https://mvclouds65-dev-ed--c.develop.vf.force.com/apex/dashboardp');
        
    //     return p;
    // }

    // public PageReference erorr(){
     
    //     Pagereference e = new PageReference('https://mvclouds65-dev-ed--c.develop.vf.force.com/apex/error_msg');
        
    //     return e;
    // }


    }






    
        

    
    // public Pagereference selacc() {
    //     // string getid = apexpages.currentpage().getparameters().get('conlst');
    //     system.debug(getid);
       
           
               
    //     // con1=[Select id , name  , AccountId , Account.name , (select Id , name from Opportunities )from Contact where Id=:getid];
    //             // PageReference pageRef = new PageReference('https://mvclouds65-dev-ed--c.develop.vf.force.com/apex/dashboardp?id='+getid); 
    //             // // pageRef.getParameters().put('Contact',getid);
   
    //             // System.debug('jhwho'+pageRef);
    //             // // /apex/Mypage?id={!Event.Id}&{!parameter}

    //             // return pageRef;
               
    //     }
   
   
    // SELECT Id, Name FROM Contact 
    // WHERE AccountId IN 
    //     (SELECT AccountId 
    //             FROM Opportunity 
    //             WHERE RecordType.Name IN ('1A','1B'))
    //  accconts1=[select id,name,(select id,lastname from contacts) ,(select name from Opportunities ) from account where id =:getId ];