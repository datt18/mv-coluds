
public with sharing class task3exc {
    public List<Contact> conList {get;set;}
    public task3exc(ApexPages.StandardSetController controller) {

    }
    
    public PageReference ContactLists()
    {
// Checking account id is not null.
    if(ApexPages.currentPage().getParameters().get('id') != null)
      conList = [Select id,Name,Phone,Email from contact where accountId =: ApexPages.currentPage().getParameters().get('id')];
     return null;
    }   

}