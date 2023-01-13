
trigger task7 on Opportunity(after update) {

    Set<Id> oppIds = new Set<Id>();
    
    for(Opportunity o : Trigger.new){
        if(o.Name != Trigger.oldMap.get(o.Id).Name){
            oppIds.add(o.Id);
        }
    }
    
    if(oppIds != null && oppIds.size()>0){
        List<Task> taskList = new List<Task>();
        for(Id oId : oppIds){
            Task tsk = new Task();
            tsk.WhatId = oId;
            tsk.OwnerId = Trigger.newMap.get(oId).OwnerId;
            tsk.Subject = 'Opportunity Name Modified';
            tsk.Description = 'Opportunity Name has been modified';
            taskList.add(tsk);
        }
        if(taskList.size() > 0){
            insert taskList;
        }
        }
    }