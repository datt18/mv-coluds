

public with sharing class task54c{ 
    public List<Account> records {get; set;} 
    public task54c(){ 
    records = [select Name, AccountNumber from Account]; 
    } 
    }