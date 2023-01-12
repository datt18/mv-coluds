

trigger  teigger_task2_day3  on Contact (after update) {
    map<id,string> conMap = new map<id,string>();
    set<id> accId = new set<Id>();
    for(Contact c : Trigger.new){
        conMap.put(c.AccountId,c.Title);
        accId.add(c.id);
    }
    List<contact> conList = new List<contact>();
    if( trigger.isupdate){
        for(account a : [select id,(select id,AccountId,title from contacts where id =: accId ) from account where id in : conMap.keySet()]){
            for(contact c : a.contacts){
                c.Title=conMap.get(c.AccountId);   
                conlist.add(c);
            }
        }
    }
    update conlist;
}
