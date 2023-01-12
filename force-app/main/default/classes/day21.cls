
public with sharing class day21 {
    public contact con {get;set;}
    public String name { get; set; }
    public String selectedObject { get; set; }
    public List<Account> acc {get;set;}
    public String getListOfAccounts { get; set; }

    public String selectedaccountId {set;get;}
    
   

    
    public void save(){
        insert con;
        con = new contact();
    }

  public List<SelectOption> getListOfAccounts()
{
           List<Account> AccountList = [select id,Name from Account] ;
        //    System.debug('Accounts'+AccountList.size());
           List<SelectOption> AccountOptionList = new List<SelectOption>();
           AccountOptionList .add(new SelectOption( ' ' ,'-- select --'));
           for(Account acc : AccountList )
           {
                      AccountOptionList .add(new SelectOption(acc.id , acc.Name));
           }
          return AccountOptionList ;
}

// public PageReference selacc() {
//   string getid = apexpages.currentpage().getparameters().get('conlst');
//        accconts1=[select id,name,(select id,lastname from contacts) ,(select name from Opportunities ) from account where id=:getid ];
//           system.debug(accconts1);
//     return null;
//   }

  public day21() {
    con = new contact();

    
    // acclst=[select id,name  from account];
    // selectedaccountId ='';


}

}

//     public List<Selection> getselected accnamefields(){
//         List<Selection> Listname = new List<Selection>();
//         Listname.add(new SelectOption('','-- none --'));
//         for(Account acc.[select id,name FROM Account]);
//         Listname.add(new SelectOption(acc.id,acc.name));

//     }
//     return Listname;