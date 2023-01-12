

public class  day3_task3c  {
    public static void accountMethod(List<Account>aclist,map<id,account> oldmap){
        set<id> accountId=new set<id>();
        for(Account ac:aclist){
            account accountOld=oldmap.get(ac.id);
            if(ac.Name!=accountOld.Name){
                accountId.add(ac.Id);
                System.debug(accountId);//chenge account name id 
            }
        }
    
        if(accountId.size()>0){
            map<id,account> accountmap=new map<id,account>([select id,Name,(select id,LastName from contacts) from account where id in:accountId]);
            System.debug(accountmap);
            List<contact> clist=new List<contact>();
            for(account ac:aclist){
                account accountOld=oldmap.get(ac.id);
                if(ac.Name!=accountOld.Name){
                    if(accountmap.containskey(ac.id)){
                        account ac1=accountmap.get(ac.id);
                        List<contact>lstCont = ac1.contacts;
                        System.debug(lstCont);
                        for(contact c:lstCont){
                            c.LastName=ac.Name;
                            clist.add(c);
                        }
    
                    }
                }
            }
            if(!clist.isEmpty()){
                update clist;
            }
    
        }
    }}
