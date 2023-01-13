


// trigger task10a on Account (after insert) {
// 	//list to store the Ids of the Accounts
//   	list<Id> accountIds = new list<Id>();
  
// 	//loop to add the Ids of the Accounts to the list
//   	for(Account acc : trigger.new){
//     	accountIds.add(acc.Id);
//   	}
  
// 	//create an Approval Request
//   	Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
  
// 	//set the object Id
//   	req1.setObjectId(accountIds[0]);
  
// 	//set the next approval step
//   	req1.setNextApproverIds(new Id[] {UserInfo.getUserId()});
  
// 	//submit the request
//   	Approval.process(req1);
// }

trigger task10a on Account (after insert) {
	for (Account acc : Trigger.new) {
	  Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
	  req.setObjectId(acc.Id);
	  req.setSubmitterId(UserInfo.getUserId());
	  req.setNextApproverIds(new Id[] { UserInfo.getUserId() });
	  Approval.ProcessResult result = Approval.process(req);
	}
  }