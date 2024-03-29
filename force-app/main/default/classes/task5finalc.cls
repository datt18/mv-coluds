public with sharing class task5finalc {
public Account acc{get;set;}
public List<Account> accountList {get;set;}
// create a list of strings to hold the conditions
List<string> conditions = new List<string>();
public Integer countTotalRecords{get;set;}
public String name { get; set; }
private integer totalRecs = 0;
private integer OffsetSize = 0;
private integer LimitSize= 10;

public task5finalc(){
system.debug('==>AccountMultipleSearchWithPagenationCLS  is calling==>');
countTotalRecords = [SELECT count() FROM Account ];
 acc = new Account();


 //accountList  = new List<Account>();
}

public void searchAcc(){
totalRecs = 0;
OffsetSize = 0;
if(accountList !=null && accountList.size()>0){
 accountList=null;
}
searchAccounts ();
conditions.clear();
}


public Void searchAccounts(){

System.debug('Total Records is ==>'+totalRecs);
System.debug('OffsetSize is ==>'+OffsetSize);

if(accountList != null && !accountList.isEmpty()){
  accountList.clear();
}
 String strQuery ='SELECT Id,Name,AccountNumber,CreatedDate,Phone,Website,Industry,AnnualRevenue From Account';


 if(acc.Name !=null && acc.Name !=''){
   conditions.add('Name Like \'%' +acc.Name +'%\' ');
 }
  if(acc.AccountNumber !=null && acc.AccountNumber !=''){
   conditions.add('AccountNumber Like\'%' +acc.AccountNumber +'%\' ');
 }

  if (conditions.size() > 0) {
   strQuery += '  WHERE ' + conditions[0];
   for (Integer i = 1; i < conditions.size(); i++)
            strQuery += '  AND ' + conditions[i];
  }
 if(totalRecs !=null && totalRecs ==0){
    List<Account> accTemp = Database.query(strQuery);
    totalRecs = (accTemp !=null &&accTemp.size()>0)?accTemp.size():0;
 }

 system.debug('strQuery ==>'+strQuery );
 
  strQuery += ' ORDER BY Name  ASC, CreatedDate DESC LIMIT :LimitSize OFFSET :OffsetSize';
  
  accountList  =Database.query(strQuery);
  
  
}

public void FirstPage()
{
OffsetSize = 0;
searchAccounts();
}
public void previous()
{
OffsetSize = (OffsetSize-LimitSize);
searchAccounts();
}
public void next()
{
OffsetSize = OffsetSize + LimitSize;
searchAccounts();
}
public void LastPage()
{

searchAccounts();
}
public boolean getprev()
{

if(OffsetSize == 0){

return true;
}
else {

return false;
}
}
public boolean getnxt()
{
if((OffsetSize + LimitSize) > totalRecs){

return true;
}
else {

return false;
}
}


}