// import { LightningElement,track,api } from 'lwc';
// import { createMessageContext,releaseMessageContext,publish} from 'lightning/messageService';

// import msg from '@salesforce/messageChannel/SampleMessageChannel__c'
// import fetchAccount from '@salesforce/apex/lwc3a_account_list.fetchAccount';


// export default class Lwc_task3a1 extends LightningElement {
//     @track acc;
// // @track con;
// message;
// msg;

// // @api acc;
// // @api con;
// // @api opp;

// @track recordId;
// @track myMessage = '';ariaBusy

// context = createMessageContext();
// // @track opp;
// connectedCallback(){
// fetchAccount()
// .then(result => {
// this.acc = result;

// console.log(JSON.stringify(result));
// console.log("result123",this.acc);
// });
// }
// handleClick(event) {
// try{


//   // event.preventDefault();  
//   console.log(event);
//   console.log('try');
//   console.log(event.target.value);
// console.log('on');
//   console.log('no one    '+event.target.dataset.value);


//   const  message = {
//       recordId: event.target.value,
//       recordData: { value: "message from Lightning Web Component" }
//   };

//   publish(this.context, msg , message);
//   console.log('final');
//   console.log(message);
//   console.log('final1');
//   console.log(this.recordId);
// }catch(e){
//   console.log({e});
// }
  
// }

// }

import { LightningElement, api, wire } from 'lwc';
import showAccList from '@salesforce/apex/lwc3a_account_list.showAccList';
import { publish, MessageContext } from 'lightning/messageService';
import AccIdPass from '@salesforce/messageChannel/FirstMessChannel__c'

export default class Lwctask3 extends LightningElement {

    listOfAcc = [];

    @wire(MessageContext)
    messageContext;

    @wire(showAccList)
    showAccList({data,error}) {
        if(data) {
            console.log('Data = '+JSON.stringify(data));
            this.listOfAcc = Object.keys(data).map(item=>({"name":data[item],
            "value": item
            
            }))
           // console.log('value'+item);
        }
        // console.log('listOfAcc = '+this.listOfAcc);
    }

    demo(event){
        console.log(' is called');
        console.log(event.target.value);
        const payload = {
            selectedAccId : event.target.value

        };
        publish(this.messageContext, AccIdPass, payload);
    }
}
