public class task3newc
{
    list<AccountWrapper> wraplist=new list<AccountWrapper>();
    public task3newc()
    {
       Map<Id, AccountWrapper> accMap=new Map<Id, AccountWrapper>();
       for(account a:[SELECT CreatedbyID,Account.Name,(SELECT      
                name,Contact.FirstName, Contact.LastName 
                FROM Account.Contacts) FROM Account])
       {
           AccountWrapper accWrap=accMap.get(a.CreatedByID);
           if (null==accWrap)
           {
              accWrap=new AccountWrapper();
              accMap.put(a.CreatedByID, accWrap);
              accWrap.userId=a.CreatedById;
           }


           accWrap.accounts.add(a);
       }

       wrapList=accMap.values();
   }

   public list<AccountWrapper> getaccounts()
   {
      return wrapList; 
   }

   public class AccountWrapper
   {
      public Id userId {get; set;}
      public List<Account> accounts {get; set;}
      public AccountWrapper()
      {
         accounts=new List<Account>();
      }
   }
}