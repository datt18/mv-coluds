
public with sharing class dashboardc {

    public list<contact> conlst { get; set; }

    public list<account> accconts1 { get; set; }

    public PageReference selacc() {
    string getid = apexpages.currentpage().getparameters().get('conlst');
         accconts1=[select id,name,(select id,lastname from contacts) ,(select name from Opportunities ) from account where id=:getid ];
            system.debug(accconts1);
      return null;
    }


    public List<Account> acclst { get; set; }
   public  dashboardc (){
     acclst=[select id,name  from account ];
     system.debug(acclst);
   
   }
}