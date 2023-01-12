trigger fristtregger on Account (before insert) {
    for(Account acc:trigger.new){
        if(acc.name=='ken'){
            acc.phone='1234567890';
        }
    }

}