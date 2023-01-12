// import { LightningElement,track,api } from 'lwc';
// import fetchAccount from '@salesforce/apex/lwc3a_account_list.fetchAccount';
// import { createMessageContext,APPLICATION_SCOPE,subscribe,unsubscribe ,releaseMessageContext,publish} from 'lightning/messageService';
// import msg from "@salesforce/messageChannel/SampleMessageChannel__c";

// import fetchContact from '@salesforce/apex/lwc3a_account_list.getContacts';

// import fetchOpportunity from '@salesforce/apex/lwc3a_account_list.fetchOpportunity';
// const columns = [{
//     label: 'First Name',
//     fieldName: 'FirstName'
// },
// {
//     label: 'Last Name',
//     fieldName: 'LastName'
// },
// {
//     label: 'Email',
//     fieldName: 'Email',
//     type: 'email'
// },
// {
//     label: 'Phone',
//     fieldName: 'phone',
//     type: 'phone'
// }

// ];

// const columnsOpp = [{
//     label: 'Name',
//     fieldName: 'Name'

// }

// ];
 
// export default class Lwc_task3a2 extends  LightningElement {
// @track receivedmessage ='';
// contex = createMessageContext();
// @track accountId;
// //     @track acc;
// // @track con;
// @api recordId;
// message;
// msg;
// // @track opp;
// @api acc;
// @api con;
// @api opp;

// // @api
// // refreshList(accountId) {
// //     this.fetchFileData(accountId);
// //     // this.fetchFileData(accountId);

    
// //     console.log('hello'+accountId);

// // }

// // connectedCallback(){
// //     this.fetchFileData(this.recordId);
// //     // this.fetchContact(this.accountId);
// //     console.log('hello1233'+accountId);
// //     console.log('hello3'+this.recordId);


    
// // }
// // connectedCallback(){
// //     this.sub();
// // }

// // sub(){
// //     if(this.subscription){
// //         return;
        
// //     }
// //     this.subscription = subscribe(this.contex,msg,(message)=>{
// //         this.handleMessage(this.message);
// //  }, {scope: APPLICATION_SCOPE});
// //  console.log('h'+this.contex);
// // }

// // handleMessage(message){
// //     this.accountId = message.recordId;
// //     this.receivedmessage = message ? message.recordData.value : 'no message payload'
// //     console.log('h'+this.accountId);

// // }

// contactFetch(event){
//     this.message = event.target.value;
//     console.log('Contact Id-->'+this.message);
//     fetchContact({accountId : this.message})
    
//     .then(result => {
//     this.con = result;
    
//     console.log(JSON.stringify(result));
//     console.log("result1",this.con);
//     })
//     .catch(error =>{
//     this.error = error;
    
//     })
    
//     this.msg = event.target.value;
//     console.log('Oppoertunity Id-->'+this.msg);
//     fetchOpportunity({accountId : this.msg})
//     .then(result => {
//     this.opp = result;
    
//     console.log(JSON.stringify(result));
//     console.log("result2",this.opp);
//     })
//     .catch(error =>{
//     this.error = error;
        
//     })
// }
//     connectedCallback(){
//         this.subscribeMC();
//     }
//     subscribeMC() {
//         if (this.subscription) {
//             return;
//         }
//         this.subscription = subscribe(this.context, msg, (message) => {
//             this.handleMessage(message);
//         },{scope: APPLICATION_SCOPE});
//      }
//      handleMessage(message) {       
//         console.log('message:::'+JSON.stringify(message));
//         this.accountId = message.recordId;
//         this.receivedMessage = message ? message.recordData.value : 'no message payload';
//     }
    
    
// }

import { LightningElement, wire, api } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import AccIdPass from '@salesforce/messageChannel/FirstMessChannel__c';
import showCntOppList from '@salesforce/apex/lwc3a_account_list.showCntOppList'

export default class Lwc3task extends LightningElement {

    @api accId = '';
    subscription = null;
    showCnt = false;
    showOpp = false;
    newCntList = [];
    newOppList = [];

    @wire(MessageContext)
    messageContext;

    @wire(showCntOppList, {accId : '$accId'})
    cntList({data,error}) {
        if(data) {
            console.log('data'+data);
            this.showOpp = data.showOpp;
            this.showCnt = data.showCnt;
            if(this.showCnt == true){
                this.newCntList = data.cntlist;
                console.log('newCntList = '+this.newCntList);
            }
            if(this.showOpp == true){
                this.newOppList = data.opplist;
              //  console.log('opp = '+this.newOppList);

            }
        }
    }

    connectedCallback() {
        this.subscribeChannel();
    }

    subscribeChannel() {
        this.subscription = subscribe(
            this.messageContext,
            AccIdPass,
            (message)=> this.handelChange(message)
        );
     //   console.log('try');
      //  console.log(message);
    }

    handelChange(message) {
        console.log('message = '+JSON.stringify(message));
        this.accId = message.selectedAccId;
      //  console.log('hello');
     //   console.log(accId);
    }
    
}

