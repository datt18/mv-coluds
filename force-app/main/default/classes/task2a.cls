public with sharing class task2a {
    public Contact con {get;set;}
    public task() {
    con = new Contact();
    }
    public void save(){
        insert con;
        con = new Contact();
        
    }
}
