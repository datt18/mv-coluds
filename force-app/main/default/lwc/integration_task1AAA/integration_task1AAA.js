// import { LightningElement, api, wire, track } from 'lwc';
// import { ShowToastEvent } from "lightning/platformShowToastEvent";
// import { CloseActionScreenEvent } from "lightning/actions";
// import sendEmailToController from "@salesforce/apex/integration_task1_apex.sendEmailToController";
// import { getRecord} from 'lightning/uiRecordApi';
// import email from '@salesforce/schema/Contact.Email';
// const fillds = [email];
// export default class integration_task1AAA extends LightningElement {
 
//  @track emailbody = false;
//  @track sendemail = true;
//  @api recordId;
//  fileData
//  f_name
//  emailbody = false;
//  openfileUpload(event) {
//     console.log('try');
//  const file = event.target.files[0];
//  var reader = new FileReader()
//  reader.onload = () => {
//  var base64 = reader.result.split(',')[1]
//  this.fileData = {
//  'filename': file.name,
//  'base64': base64,
//  'recordId': this.recordId
//  }
//  console.log(this.fileData);
//  this.f_name= this.fileData.filename;
//  console.log(this.f_name);
//  this.f_name = this.f_name.replace('.png','');
//  console.log(this.f_name);
//  }
//  reader.readAsDataURL(file)
//  }
 
//  mail;
//  record;
//  @wire(getRecord, { recordId: '$recordId', fields: fillds }) 
//  getallrecord({data,error}){
//  if (data) {
//  this.record = data;
//  this.mail = JSON.stringify(this.record.fields.Email.value);
//  console.log('tttt');
//  console.log(this.mail);
//  this.mail = this.mail.replace('"','');
//  this.mail = this.mail.replace('"','');
//  console.log('try');
//  console.log(this.mail);

//  }else{
//  console.log(this.error);
//  }
//  };
 
//  handleSubjectChange(event) {
//  this.e_subject = event.target.value;
//  console.log(this.e_subject);
//  }
//  handleBodyChange(event) {
//  this.body = event.target.value;
//  console.log('body');
//  console.log(this.body);
//  }
//  handleFinish(toSend ,subject ,body,filename){
//  console.log(this.mail);
//  console.log(this.e_subject);
//  this.body = this.body.replace('<p>','');
//  this.body = this.body.replace('</p>','');
//  console.log(this.body);
// //  const emailDetails = {
// //  toSend : this.mail,
// //  subject: this.e_subject,
// //  body: this.body,
// //  filename : this.f_name
 
// //  };

// // console.log('toSend');
// //  console.log(toSend);
// //  console.log('filename');
// //  console.log(filename);

// //  console.log('www'+this.emailDetails);
//  sendEmailToController({toSend : this.mail,
//      subject: this.e_subject,
//     body: this.body,
//     filename : this.f_name})
    
//  .then(() => {
//     console.log('toSend');
//     console.log(this.toSend);
//     console.log('filename');
//     console.log(filename);
//     console.log('body');
//     console.log(body);
//     console.log('subject');
// log.console(subject);
// // console.log(this.emailDetails);
//  console.log("Email Send");
//  })
//  .catch((error) => {
//  console.log('error');
//  console.error("Error in sendEmailController:", this.error);
//  });

//  this.emailbody = true;
//  this.sendemail = false;    
//  }
//  colseevent(event){
//  this.dispatchEvent(new CloseActionScreenEvent());
//  }
// }


import { LightningElement, api, wire, track } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { CloseActionScreenEvent } from "lightning/actions";
import sendEmailToController from "@salesforce/apex/integration_task1_apex.sendEmailToController";
import { getRecord} from 'lightning/uiRecordApi';
import email from '@salesforce/schema/Contact.Email';
const fillds = [email];
export default class integration_task1AAA extends LightningElement {
 
 @track emailbody = false;
 @track sendemail = true;
 @api recordId;
 @api fileData
 @api f_name
 cv;
 file;
 @api emailbody = false;
 openfileUpload(event) {
    alert('dattt');
    console.log(event.target);
 this.file = event.detail.files[0].name;
  this.cv = event.detail.files[0].contentVersionId;
 console.log(file);
 var reader = new FileReader()

 reader.onload = () => {
 var base64 = reader.result.split(',')[1]
 this.fileData = {
 'filename': file.name,
 'base64': base64,
 'recordId': this.recordId
 }  
 console.log(this.fileData);
 this.f_name= this.fileData.filename;
 console.log(this.f_name);
 this.f_name = this.f_name.replace('.pdf','');
 console.log(this.f_name);
 }
 reader.readAsDataURL(file)
 }
 
 mail;
 record;
 @wire(getRecord, { recordId: '$recordId', fields: fillds }) 
 getallrecord({data,error}){
 if (data) {
 this.record = data;
 this.mail = JSON.stringify(this.record.fields.Email.value);
 this.mail = this.mail.replace('"','');
 this.mail = this.mail.replace('"','');
 console.log(this.mail); 
 }else{
 console.log(error);
 }
 };
 
 handleSubjectChange(event) {
 this.e_subject = event.target.value;
 }
 handleBodyChange(event) {
 this.body = event.target.value;
 }
 handleFinish(){

 console.log(this.mail);
 console.log(this.e_subject);

 sendEmailToController({
    toSend : this.mail,
    subject: this.e_subject,
    body: this.body,
    filename : this.f_name,
    cv : this.cv
 })
 .then(() => {
 console.log("Email Send");
 })
 .catch((error) => {
 console.log('error');
 console.error("Error in sendEmailController:", error);
 });
 this.emailbody = true;
 this.sendemail = false;
 }
 colseevent(event){
 this.dispatchEvent(new CloseActionScreenEvent());
 }
}
