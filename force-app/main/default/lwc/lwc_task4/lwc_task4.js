


// import { LightningElement, api, track } from 'lwc';
// import getObjectRecords from '@salesforce/apex/lwc_task4_apex.getObjectRecords';
// import sendEmail from '@salesforce/apex/lwc_task4_apex.sendEmail';

// export default class lwc_task4 extends LightningElement {
//   @track selectedObject; 
//   @track records;
//   @track emailSubject;
//   @track emailBody;
//   @track selectedRecordIds;

//   disableObjectSelect = false;
//   showRecords = false;
//   showEmailSection = false;
//   showEmailPreview = false;                         
//   showPreviousButton = false;
//   showNextButton = true;
//   showSendButton = false;
//   showsaveButton = false;
  
//   objectOptions = [
//     { label: 'Lead', value: 'Lead' },
//     { label: 'Account', value: 'Account' },
//     { label: 'Contact', value: 'Contact' }
//   ];

//   handleObjectChange(e) {
//     this.selectedObject = e.detail.value;
//     this.disableObjectSelect = true;
//     this.showRecords = true;
//     this.showNextButton = true;
//     this.showPreviousButton = false;
//     this.showEmailSection = false;
//     this.showEmailPreview = false;
//     this.showSendButton = true;
//     // this.showsaveButton = true

//     getObjectRecords({ objectName: this.selectedObject })
//       .then(result => {
//         this.records = result;
//         console.log('result');
//         console.log(result);
//       })
//       .catch(error => {
//         console.log('Error in getObjectRecords: ', error);
//       });
//   }

//   handleRecordSelection(e) {
//     // logic to handle checkbox selection

//     const selectedId = e.target.value;

//     console.log(selectedId);
//     if (e.target.checked) {
//         console.log('eeeee');
//         console.log(selectedId);
//         // selectedId = selectedRecordIds;

//         console.log(e.target.checked);

//        // console.log(selectedRecordIds);

    
//       if (!this.selectedId) {
//         this.selectedId = [];
//         console.log('try1');
//         console.log(this.selectedId);     
//       }
//       this.selectedId.push(selectedId);
//       console.log('try2');
//       console.log(selectedId);

//     } else {
//       this.selectedId = this.selectedId.filter(
//         recordId => recordId !== selectedId 
    
//       );

//       console.log('selected id');
//       console.log(selectedId);
//     //  console.log(selectedRecordIds);
//     }
//     console.log('selected id12');
//       console.log(selectedId);
//      // console.log(selectedRecordIds);

//   }




//   handleNext() {

  
//     this.showRecords = true;
//     this.showNextButton = true;
//     this.showPreviousButton = true;
//     this.showEmailSection = true;
//     // this.showsaveButton = true;
    
//     // this.showEmailPreview = true;

//     // this.showSendButton = true;

//   }

//   handlePrevious() {

//     this.showRecords = true;
//     this.showNextButton = true;
//     this.showPreviousButton = true;
//     this.showEmailSection = false;
//     this.showEmailPreview = false;
//     this.showSendButton = true;
//     // this.showsaveButton = true
  


//   }
//   // handlesave(){
//   //   // this.showPreviousButton = true;
//   //   this.showEmailSection = false;
//   //   this.showEmailPreview = false;
//   //   this.showPreviousButton = true;
//   //   this.showSendButton = true;


//   // }

//   handleEmailChange(e) {
//     this[e.target.name] = e.target.value;
//     // console.log('hii');
//     // console.log(e.target.value);
      
//   }

  
//   handleToChange(event) {
//     this.toAddresses = event.target.value;
//     console.log('to');
//     console.log(this.toAddresses);
// }

  
//   handleSubjectChange(event) {
//     this.emailSubject = event.target.value;
//     console.log('subject');
//     console.log(this.emailSubject);
// }

// handleMessageChange(event) {
//     this.emailBody = event.target.value;
//     console.log('emailBody');
//     console.log(this.emailBody);
// }





//   handleSend() {
//     // this.selectedObject = false;
//     this.showRecords = true;
//     // this.showNextButton = true;
//     // this.showsaveButton = true;
//     this.showPreviousButton = true;
//     this.showEmailSection = false;
//     this.showSendButton = true;
//     this.showEmailPreview = true;
//     // this.showPreviousButton = true;

//     sendEmail({
//       emailSubject: this.emailSubject,
//       emailBody: this.emailBody,
//       toAddresses: this.toAddresses,
//       selectedId: this.selectedId
      
            

  
//     })
  
//         .then(() => {
//         console.log('Email sent successfully!');
//       })
//       .catch(error => {
//         console.log('Error in sending email: ', error);
//       });
//       console.log('recod id');
//       console.log(selectedId);
//      // console.log(this.selectedRecordIds);
//      console.log(emailBody);
//       console.log(emailSubject);
      
//   }
// }


import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getList from '@salesforce/apex/lwc_task4_apex.recordList';
import emailIds from '@salesforce/apex/lwc_task4_apex.Emails';
import sendEmail from '@salesforce/apex/lwc_task4_apex.sendEmails';

export default class Lwctask4 extends LightningElement {

    showLead = false;
    showAcc = false;
    showCnt = false;
    leadlist = [];
    acclist = [];

    cntlist = [];
    @track first = false;
    second = false;
    third = false;
    four = false;
    @track selectedLeadRec = [];
    @track selectedAccRec = [];
    @track selectedCntRec = [];
    totelId = [];
    sub = '';
    name = '';
    rName = [];
    emailBody = '';
    emails = [];
    names = [];
    message = '';
    showMessage = false;

    connectedCallback(){
        this.first = true;
    }

    listOfRecords(obj){
        getList({obj : obj}).then(
            data=>{
                if(obj == 'Lead'){
                    this.showLead = true;
                    this.showAcc = false;
                    this.showCnt = false;
                    this.leadlist = data.leadlist;
                    console.log('leadlist = ',this.leadlist);
                }
                if(obj == 'Account'){
                    this.showAcc = true;
                    this.showLead = false;
                    this.showCnt = false;
                    this.acclist = data.acclist;
                }
                if(obj == 'Contact'){
                    this.showCnt = true;
                    this.showLead = false;
                    this.showAcc = false;
                    this.cntlist = data.cntlist;
                }
            }
        )
    }

    showError(val) {
        const toastEvt = new ShowToastEvent({
            title: 'Error',
            message: val,
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(toastEvt);
    }

    demo(event){
        if(event.target.value != ''){
            const obj = event.target.value;
            this.listOfRecords(obj);
        }
        else{
            this.showLead = false;
            this.showAcc = false;
            this.showCnt = false;
        }
    }

    check(event){
        console.log('keypress = '+event.target.dataset.id);
        console.log('check of not = '+event.target.checked);
        if(this.showLead == true){
            if(event.target.checked){
                this.selectedLeadRec.push(event.target.dataset.id);
                console.log('selectedLeadRec = '+this.selectedLeadRec);
                
            }
            else{
                const uncheckIndex = this.selectedLeadRec.indexOf(event.target.dataset.id);
                console.log('Index = '+uncheckIndex)
                this.selectedLeadRec.splice(uncheckIndex, 1);
                console.log('selectedLeadRec = '+this.selectedLeadRec);
            }
        }
        if(this.showAcc == true){
            if(event.target.checked){
                this.selectedAccRec.push(event.target.dataset.id);
                console.log('selectedAccRec = '+this.selectedAccRec);
            }
            else{
                const uncheckIndex = this.selectedAccRec.indexOf(event.target.dataset.id);
                console.log('Index = '+uncheckIndex)
                this.selectedAccRec.splice(uncheckIndex, 1);
                console.log('selectedAccRec = '+this.selectedAccRec);
            }
        }

        if(this.showCnt == true){
            if(event.target.checked){
                this.selectedCntRec.push(event.target.dataset.id);
                console.log('selectedCntRec = '+this.selectedCntRec);
            }
            else{
                const uncheckIndex = this.selectedCntRec.indexOf(event.target.dataset.id);
                console.log('Index = '+uncheckIndex)
                this.selectedCntRec.splice(uncheckIndex, 1);
                console.log('selectedCntRec = '+this.selectedCntRec);
            }
        }
    }

    next(){
        console.log('next method is called');
        console.log('first = '+typeof(this.first));
        console.log('first value = ',this.first);
        // var temp = this.first;
        if(this.first){
            console.log('hjgfhgcghh');
            // console.log('length = '+this.selectedRec.length);
            if(this.selectedLeadRec.length == 0 && this.selectedAccRec.length == 0 && this.selectedCntRec.length == 0){
                this.showError('Please Select Atleast One Record');
                this.second = false;
                this.third = false;
            }
            else{
                this.first = false;
                this.second = true;
                this.third = false;
            }
        }
        else if(this.second == true){

            if(this.sub == '' || this.emailBody == ''){
                this.showError('Please Fill The Required Fields');
                this.third = false;
                // this.first = false;
            }
            else{
                this.first = false;
                this.second = false;
                this.third = true;
                this.Emails(this.selectedLeadRec, this.selectedAccRec, this.selectedCntRec);
            }
        }
    }

    previous(){
        if(this.second == true){
            this.first = true;
            this.second = false;
            this.third = false;
            // for(let i=0; i<this.selectedLeadRec.length; i++){
            //     let str = this.selectedLeadRec[i];
            //     console.log('str = '+str);
            //     document.getElementById(str).click();
            // }
        }
        else if(this.third == true){
            this.second = true;
            this.third = false;
            this.first = false;
        }
    }

    send(){
        this.sendmail(this.sub, this.emailBody, this.name, this.emails, this.names, this.totelId);
    }

    sendmail(sub, body, name, emails, names, Ids){
        sendEmail({subject : sub, body : body, name : name, emails : emails, names : names, Ids : Ids});
        this.showMessage = true;
        this.second = false;
        this.third = false;
        this.first = false;
        this.four = true;
        this.message = 'Email was successfully sent!!!';
        // document.getElementById("star").style.display = "none";
    }

    subject(event){
        this.sub = event.target.value;
        console.log('subject = '+this.sub);
    }

    custname(event){
        this.name = event.target.value;
        console.log('custname = '+this.name);
    }

    body(event){
        this.emailBody = event.target.value;
        console.log('body = '+this.emailBody);
    }

    Emails(leadIds, accIds, cntIds){
        console.log('lead = '+leadIds+' and acc = '+accIds+' and cnt = '+cntIds);
        emailIds({leadIds : leadIds, accIds : accIds, cntIds : cntIds}).then(
            data=>{
                console.log('data = ',data);
                this.emails = data.emails;
                this.names = data.names;
                this.totelId = data.totelId;
                // for(var key in data){
                //     this.emails.push(key);
                //     this.names.push(data[key]);
                // }
                console.log('emails = ',this.emails);
                // this.emails = Object.keys(data).map(item=>({"name":data[item],
                // "email": item}))
                // // this.emails = data.key();
                // console.log('emails = ',this.emails);
            }
        )
    }
}


