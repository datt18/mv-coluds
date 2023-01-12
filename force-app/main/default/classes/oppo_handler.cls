public with sharing class oppo_handler {
  public oppo_handler(){

  }


// task 3 related class

        public static void task3t(List<Opportunity> opp){
            for(Opportunity oppObject: opp){
                oppObject.StageName ='Prospecting';
                oppObject.CloseDate = System.today().addDays(15);
              }
        
            }
// task 4 related class

        public static void task4t(List<Opportunity> opp1){
          for(Opportunity re: opp1){
            re.Type = 'New Customer';
 
         }
        }
// task 7 related class        
            public static void task7t(List<Opportunity> opp22){
              List<task> carry=New List<task>();
    
              for(opportunity opp:opp22){
               if(opp.stagename=='Closed Won'){
                task t=new task(
                    whatid=opp.id, 
                    Status = 'Active',
                    Subject = 'Follow Up Test Task',
                    ActivityDate = system.today()
                 );
                carry.add(t); 
                }
               }
                 insert carry;


              // List<Task> t = new List<Task>();
              // for(Opportunity o : opp2){
              //     if(o.Name != Trigger.newmap.get(o.Id).Name){
              //        t.add(new Task(OwnerId = o.OwnerId,Subject = 'Follow Up Test Task created by datt patel')); 
        
        
              //        } 
              //  }
              //     insert t;
             }

// task 10 related class   
public static void task10t(List<Opportunity> w){

for( Opportunity o: w){
  if(o.Name != null){
      Opportunity a = w[0];

      Opportunity ac = [SELECT Id,Name FROM Opportunity WHERE Id =: a.Id];


      Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
  
      req.setComments('Submitted for approval. Please approve.');
  
      req.setObjectId(ac.Id);
  
      Approval.ProcessResult result = Approval.process(req);
   
  }
}
}


}
