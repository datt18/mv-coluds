
// trigger task8 on Account (before insert) {
//     for(Account acc : Trigger.New){
//         acc.Name = 'Mr.'+acc.Name;
//     }
// }



trigger task8 on Account (before insert) {
    for(Account a : Trigger.new){
        if(a.Name == 'ABC'){
            a.Name = 'Ms. ABC';
        }
        else if(a.Name == 'XYZ'){
            a.Name = 'Mr. XYZ';
        }
        else if(a.Name == 'PQR'){
            a.Name = 'Mrs. PQR';
        }
    }
}
