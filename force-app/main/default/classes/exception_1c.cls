
// public class exception_1c  {
//     public String ModuleName {get; set;}
//     public String StackTrace {get; set;}
//     public String ClassName {get; set;}
//     public String MethodName {get; set;}
//     // public String ExceptionCause {get; set;}
        
//     public void log(Exception ex)
//     {
//      try
//         {
//             extractExceptionData(ex); 
//             writeToObject(ex);
//             System.debug('This is a debug message');            
//         }
//         catch(Exception e)
//         {
//             new exception_1c().Module('LogException').log(e);            
//         }                 
//     }
    
//     public exception_1c Module(String Name)
//     {
//         ModuleName = name;
//         return this;
//     }
    
//     // public LogException ExceptionCause(String cause)
//     // {
//     //     ExceptionCause = cause;
//     //     return this;
//     // }
    
//     public void extractExceptionData(Exception ex)
//     {
//         try
//         {
//             stackTrace = ex.getStackTraceString()
//                          .substringBefore('\n');
            
//             className = stackTrace.substringAfter('.')
//                         .substringBefore('.'); 
            
//             methodName = stackTrace.substringBefore(':')
//                          .substringAfter(className)
//                          .substringAfter('.');    
//         }
//         catch(Exception e)
//         {
//             new exception_1c().Module('exception_1c').log(e); 
//         }                      
//     }
    
//     public void writeToObject(Exception ex)
//     {
//      try
//         {
//             Error_log__c logger = new Error_log__c();
//             logger.Module_Name__c = ModuleName;
//             logger.StackTrace__c = ex.getStackTraceString();
//             logger.Class_Name__c = className;
//             logger.Method_Name__c = methodName;
//             logger.Line_Number__c = ex.getLineNumber();
//             logger.Exception_Type__c = ex.getTypeName();
//             // logger.Exception_Cause_Override__c = ExceptionCause; 
//             // logger.Exception_Cause__c = String
//                                         // .valueOf(ex.getCause());
            
//             logger.Exception_Message__c = ex.getMessage();
            
//             insert logger;    
//         }
        
//         catch(Exception e)
//         {
//             new exception_1c().Module('exception_1c').log(e);     
//         }
        
//     }
    
// }

public with sharing class exception_1c  {
    public static void ExcTest() {
            List<Account> listacc=[select id,name,rating from account];
            
            try{
                for(Account ac:listacc){
                    if(ac.rating.equals('Hot')){
    
                    }
                }
            }catch(Exception e){
                List<Error_log__c> tasks = new List<Error_log__c>();
                System.debug('Eccc ' +e);
                Error_log__c exc = new Error_log__c();
                String stackTrace = e.getStackTraceString().substringBefore('\n');
                String className = stackTrace.substringAfter('.').substringBefore('.');	
                String methodName = stackTrace.substringBefore(':').substringAfter(className).substringAfter('.');
                System.debug('stackTrace ' +stackTrace);
                System.debug('className ' +className);
                System.debug('methodName ' +methodName);
                exc.Exception_Message__c = e.getMessage();
                exc.Exception_Type__c = e.getTypeName();
                exc.Line_Number__c= e.getLineNumber();
                // exc.More_Detailsc = e.getStackTraceString();
                exc.Method_Name__c = methodName;
                exc.Class_Name__c=className;
                exc.Name='test';
                tasks.add(exc);
                insert tasks;
            }

    }
}


// ExcTest s1=new ExcTest();
// s1.ExcTest();/