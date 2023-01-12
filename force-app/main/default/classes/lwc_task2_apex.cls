// public with sharing class lwc_task2_apex {
//      @AuraEnabled(cacheable=false)
//     public static List<ContentDocumentLink> fetchFiles(String recordId){
//         return [SELECT LinkedEntityId, ContentDocument.CreatedDate, ContentDocument.Title, ContentDocument.ContentSize, ContentDocument.FileType 
//                     FROM ContentDocumentLink  
//                 WHERE LinkedEntityId  =:recordId];
//     }
// }

// public with sharing class lwc2task {
//     public lwc2task() {

//     }
// }

  public with sharing class lwc_task2_apex {
  
      @AuraEnabled
        public Integer totalRec;
      @AuraEnabled
          public Integer rLimit = 3;
      @AuraEnabled
          public Integer off;
      @AuraEnabled
        public Map<ID, String> imgMap;  
      @AuraEnabled 
        public boolean prev; 
      @AuraEnabled 
        public boolean next;
      @AuraEnabled 
        public boolean isLoading = true;
    
      @AuraEnabled(cacheable=true)
      public static lwc_task2_apex getRelatedFilesByRecordId(String recordId, Integer offset, Integer test) {
          // Get record file IDs  
          lwc_task2_apex pg = new lwc_task2_apex();
        Integer rLimit = 3;
        Integer totalRec;
        List<ContentDocumentLink> tFiles = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];
        System.debug('tFiles = '+tFiles);
        totalRec = tFiles.size();
        List<ContentDocumentLink> files = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId LIMIT:rLimit OFFSET:offset];
        System.debug('files = '+files);
        List<ID> fileIDs = new List<ID>();
        for (ContentDocumentLink docLink : files) {
          fileIDs.add(docLink.ContentDocumentId);
        }
    
        List<ContentVersion> tdocs = [SELECT ContentDocumentId, FileExtension, Title FROM ContentVersion WHERE ContentDocumentId IN : fileIDs];
        // // totalRec = tdocs.size();
        // List<ContentVersion> docs = [SELECT ContentDocumentId, FileExtension, Title FROM ContentVersion WHERE ContentDocumentId IN : fileIDs LIMIT:rLimit OFFSET:offset];
        Map<ID, String> mapIdTitle = new Map<ID, String>();
        for (ContentVersion docLink : tdocs) {
          mapIdTitle.put(docLink.ContentDocumentId, docLink.Title);
        }
        pg.imgMap = mapIdTitle;
        // pg.off = offset;
          pg.prev = prv(offset);   
        pg.next = nxt(offset,rLimit,totalRec);
        pg.totalRec = totalRec;
        pg.isLoading = false;
        System.debug('pg = '+pg);
        return pg;
      }
    
      @AuraEnabled
      public static Integer nextPage(Integer off1) {
          Integer offset = off1;
          Integer rLimit = 1;
          offSet -= rLimit;
          return offset;
        } 
    
        @AuraEnabled
        public static Integer previousPage(Integer off1) {
            Integer offset = off1;
            Integer rLimit = 1;
            offSet += rLimit;
            return offset;
        }
    
      @AuraEnabled
      public static boolean prv(Integer offset) {
        if(offSet > 0){
          System.debug('offset = '+offset);
          return false;
        }
        else
          return true;
      }
    
      @AuraEnabled
      public static boolean nxt(Integer offSet, Integer rLimit, Integer totalRec){
        if(offSet + rLimit < totalRec){
          System.debug('offset + rLimit = '+(offset+rLimit));
          return false;
        }
        else
          return true;
      }
    }