trigger task14 on Account  (before insert) {

    List<String> myyname = new List<String>();
    List <Account> accountlist = new List<Account>();
    for(Account a: trigger.new){
        myyname.add(a.name);
    }
    accountlist =[select id,name from Account where name in : myyname];
    if(accountlist != null ){
        delete accountlist;
    }
    
}
