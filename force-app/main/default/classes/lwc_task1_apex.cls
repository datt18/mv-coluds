public with sharing class lwc_task1_apex{
    @AuraEnabled(cacheable=true)
        public static List<ContentVersion> getVersionFiles(String recordId){
            try {
                return [
            SELECT
            Id,
                    Title,
                    ContentDocumentId,
                    FileType, 
            ContentSize,
            FileExtension,
            VersionNumber,
            CreatedDate,
            VersionData,
                    FirstPublishLocationId
            FROM ContentVersion
            WHERE FirstPublishLocationId =:recordId
                ORDER BY CreatedDate DESC
            ];
            
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }
    }