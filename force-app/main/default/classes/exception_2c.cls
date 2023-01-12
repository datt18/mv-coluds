// public with sharing class exception_2c {
//     public exception_2c() {

//     }
// }

public class exception_2c {
 
    public static void test1()
    {
        try
        {
           integer i = 1/0;    
        }
        catch(exception ex)
        {
            new exception_1c();
        }
    }
    
    public static void test2()
    {
        try
        {
          Account acc = [SELECT Id, Name FROM Account 
                         WHERE Name =  'new'];            
        }
        catch(exception ex)
        {
            new exception_1c();
                // .Module('unitTestModule')
                // // .ExceptionCause('Probably no data in account')
                // .Log(ex);
        }
        
    }
}