
public with sharing class aura_task1_apex

{
  @AuraEnabled
  public static List<Account> getOpportunities(){
      
      return [select id,name,(select Name,phone,Email from contacts) from account];
  }
  @AuraEnabled
  public static List<Account> getByName(String searchKey){
      String name = '%' + searchKey + '%';
      return [select id,name,(select Name,phone,Email from contacts) FROM account WHERE name LIKE :name ];
  }
  
}


