// public with sharing class lwc_task5_apex {
  
//         @AuraEnabled
//         public static Map<String, List<Object>> getRecordsBySearch(String searchKey, List<String> objectNames) {
//             Map<String, List<Object>> result = new Map<String, List<Object>>();
//             for (String objectName : objectNames) {
//                 List<Object> records = new List<Object>();
//                 for (SObject obj : searchObjects(objectName, searchKey)) {
//                     records.add(obj);
//                     // System.debug('obj');
//                     // System.debug(obj);
//                     // System.debug(objectName);
//                 }
//                 result.put(objectName, records);
//             //     // System.debug('result   '+ result);
//             }
//             return result;
//         }
        

//         // private static List<SObject> searchObjects(String objectName, String searchKey) {
//         //     List<SObject> records = new List<SObject>();
//         //     if (objectName == 'Account') {
//         //         records = [SELECT Name, Id, AnnualRevenue FROM Account WHERE Name LIKE :'%' + searchKey + '%'];
//         //     } else if (objectName == 'Opportunity') {
//         //         records = [SELECT Name, Id, StageName,CloseDate FROM Opportunity WHERE Name LIKE :'%' + searchKey + '%'];
//         //     } else if (objectName == 'User') {
//         //         records = [SELECT Name, Id  FROM User WHERE Name LIKE :'%' + searchKey + '%'];
//         //     }
//         //     else if (objectName == 'contact') {
//         //         records = [SELECT Name, Id FROM Contact WHERE Name LIKE :'%' + searchKey + '%'];
//         //     }

//         //     return records;
           
//         // }

//         @AuraEnabled(cacheable=true)
//     public static List<sObject> searchObjects(String objectName ,String searchKey) {
//         List<SObject> records = new List<SObject>();
        
        
//         String records = 'FIND {' + searchKey + '} IN ALL FIELDS RETURNING Account (Id, Name), Contact (Id, Name), Opportunity (Id, Name), User(Id, Name)';
//        return records;
//     }
//     }


// public static Map<String, List<sObject>> searchRecords(String searchInput, String objectName) {
//     Map<String, List<sObject>> searchResult = new Map<String, List<sObject>>();
//     String query = 'FIND :searchInput IN ALL FIELDS RETURNING ' + objectName + '(Id, Name)';
//     List<List<sObject>> searchList = Search.query(query);
//     searchResult.put(objectName, searchList[0]);
//     return searchResult;


public with sharing class lwc_task5_apex {
    @AuraEnabled
    public static List<SObject> getRecords(String searchKey, List<String> selectedObjects){
        
        // List<List<SObject>> sObjectRecordsList = new List<List<SObject>>();
        List<list<SObject>> sObjectRecordsList = new List<List<SObject>>();

        for(String objectName : selectedObjects){
            System.debug(objectName);                                                                                                   
            String sosl = 'SELECT Id, Name, CreatedDate FROM ' + objectName;

            String sss;

            System.debug('mew');
            System.debug(sosl);
            System.debug(objectName);
            
           // String sosl = 'FIND {objectName} IN ALL FIELDS RETURNING Account (Id, Name), Contact (Id, Name), Opportunity (Id, Name), User(Id, Name)';
            if(!String.isBlank(searchKey)){
              // sosl += ' WHERE Name LIKE \'%' + searchKey + '%\'';
              //sosl += 'FIND {' + searchKey + '}  IN ALL FIELDS RETURNING';
             
            //    System.debug('qqqqqqq');

            //    System.debug(searchKey);  
            
             sss = 'FIND :searchKey IN ALL FIELDS RETURNING ' + objectName + '(Id, Name)';
            // sss =  'FIND {'+ searchKey +'} IN ALL FIELDS RETURNING Account (Id, Name), Contact (Id, Name), Opportunity (Id, Name), User(Id, Name)';
               System.debug(sss);
            //   System.debug(sss);
            }
            // System.debug(Database.query(sss));
             sObjectRecordsList= search.query(sss);
             //sObjectRecordsList.add(Database.query(sosl));



           
        }
       
        List<SObject> sObjectRecords = new List<SObject>();
        for(List<SObject> sObjectList : sObjectRecordsList){
            for(SObject obj : sObjectList){
                sObjectRecords.add(obj);
                System.debug('obj');
                System.debug(obj);
            }
            
        }

        return sObjectRecords;

        


    }
    
}




