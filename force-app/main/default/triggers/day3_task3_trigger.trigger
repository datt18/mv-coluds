trigger  day3_task3_trigger on Contact (after insert,after update,before insert,before update)

     {
        Set<Id> Accountids = new Set<Id>();
        List<Contact> Contacts = new List<Contact>();


        List<Contact> conlist = Trigger.isUpdate ? Trigger.old : Trigger.new;// if is update then 
        for(Contact c : conlist){

            if(Trigger.isInsert || (c.Amount__c != Trigger.oldMap.get(c.id).Amount__c)){

                Accountids.add(c.AccountId);

            }
        }

        List<Account> accountToUpdate  = new List<Account>([SELECT Id, Parent_amount__c, Name, (SELECT Amount__c from Contacts  WHERE amount__c != null) FROM Account WHERE  ID  =:Accountids]);
        System.debug('try 2'+accountToUpdate);
         public Decimal count = 0;
         for(Account acc : accountToUpdate ){
          
           
            for(contact con :Trigger.new){
                System.debug(con.amount__c);
                count = con.amount__c/acc.Parent_amount__c;
                System.debug('try4'+count);
                Decimal ro = count.round(RoundingMode.UP);
                System.debug('try5'+ro);
                 

                if(con.amount__c!=null && con.amount__c > acc.Parent_amount__c && con.AccountId!= null){
                    decimal total = con.amount__c;
                    con.amount__c = acc.Parent_amount__c;
                     for(Integer i= 1; i<=ro  -1;i++)
                     {
                        contact con1 = new Contact();
                        con1.Lastname = acc.name + i;
                        con1.AccountId = acc.Id;
                        con1.amount__c = total - acc.Parent_amount__c;
                        total = con1.amount__c;
                        Contacts.add(con1);
                        System.debug('try hello'+contacts);


                     }
                     System.debug('all list of contact'+contacts);
                

                }
                System.debug('insert this'+Contacts);
            }
            Insert Contacts;
            System.debug('insert this1'+Contacts);

         }
         System.debug('insert this2'+Contacts);
        //  Insert Contacts;
         

     }






    // trigger  day3_task3_trigger on Contact (after insert,after update)
    // {
    //     set<Id> accountids = new set<Id>();
    //     Map<Id,Account> updateAccount =new Map<Id,Account>();
    //     for(Contact opp : Trigger.new)
    //     {
    //         if(opp.AccountId != null && opp.Amount__c != null)
    //         {
    //             accountids.add(opp.AccountId);
    //         }
    //         // else
    //         // {
    //         //     opp.addError('Fields should not be empty.');
    //         // }
    //     }
    //     for(AggregateResult Result : [SELECT AccountId,max(Amount__c)maxs FROM
    //                                   Contact WHERE AccountId in :AccountIds GROUP BY AccountId ])
    //     {
    //         Account acc = new Account();
    //         acc.Id = (String)Result.get('AccountId');
    //         acc.Parent_amount__c	 = (Decimal)Result.get('maxs');
    //         // acc.Total_Amount__c = (Decimal)Result.get('mins');
    //         UpdateAccount.put(acc.Id, acc);
    //     }
    //     if(UpdateAccount.size()>0 )
    //     {
    //         Update UpdateAccount.values();
    //     }
    // }



