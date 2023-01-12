public class task21 {
    
    public Contact con {get;set;}

    public task21() {

        con = new Contact();

    }
    public void save(){
        insert con;
        con = new Contact();
        
    }
}
