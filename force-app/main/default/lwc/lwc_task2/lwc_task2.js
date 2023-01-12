// import { LightningElement, track,api } from 'lwc';
// import fetchFiles from '@salesforce/apex/lwc_task2_apex.fetchFiles';
// export default class lwc_task2 extends LightningElement {
//     @api recordId;
//     @track lstAllFiles;
//     @track error;
//     get acceptedFormats() {
//         return ['.pdf','.png','.jpg'];
//     }
 
//     handleUploadFinished(event) {
//         this.connectedCallback();
//     }

//         //     fetchFiles({recordId:this.recordId})
//     //     .then(result=>{
//     //         // this.records = result;
//     //         console.log(result);
//     //         console.log(this.recordId);


//     //         this.lstAllFiles = result.length;
//     //         this.error = undefined;
//     //         console.log(this.lstAllFiles);
            
//     //         this.pageSize = this.pageSizeOptions[0]; 
//     //         console.log(this.pageSize);
//     //         this.paginationHelper();
//     //     }).catch(error=>{
//     //         this.lstAllFiles = undefined; 
//     //         this.error = error;
//     //         console.log('error while fetch contacts--> ' + JSON.stringify(error));
            

//     //     })

//      pageSizeOptions = [5, 10, 25, 50, 75, 100]; //Page size options
//     pageSize;
//     pageNumber = 1;    
//     recordsToDisplay = [];
//     records = [];

//      //No.of records to be displayed per page

//          // JS function to handel pagination logic 
  

//     connectedCallback() {
//         fetchFiles({recordId:this.recordId})
//         .then(result=>{
//             console.log( result);
//             this.pageSize = this.pageSizeOptions[0];
//             this.records = result;
//             console.log('hii'+result);
//             this.lstAllFiles = result; 
//             console.log('hii12'+result);
//             this.error = undefined;
//             console.log(this.pageSize);
//             console.log('page size');

//             this.paginationHelper();

//         }).catch(error=>{
//             this.lstAllFiles = undefined; 
//             this.error = error;
//             console.log(this.error);
//             console.log('error while fetch contacts--> ' + JSON.stringify(error));

//         })
//     }


    
//     get bDisableFirst() {
//         return this.pageNumber == 1; 
//     }

//     get bDisableLast() {
//         return this.pageNumber == this.totalPages; 
        
//     }
   
//     handleRecordsPerPage(event) {
//         this.pageSize = event.target.value;
//         this.paginationHelper();
//     }
//     previousPage() {
//         this.pageNumber = this.pageNumber - 1;
//         this.paginationHelper();
//     }
//     nextPage() {
//         this.pageNumber = this.pageNumber + 1;
//         this.paginationHelper();
//     }
//     firstPage() {
//         this.pageNumber = 1;
//         this.paginationHelper();
//     }
//     lastPage() {
//         this.pageNumber = this.totalPages;
//         this.paginationHelper();
//     }

//     paginationHelper() {
//         this.recordsToDisplay = [];
//         // calculate total pages
//         this.totalPages = Math.ceil(this.totalRecords / this.pageSize);
//         // set page number 
//         if (this.pageNumber <= 1) {
//             this.pageNumber = 1;
//         } else if (this.pageNumber >= this.totalPages) {
//             this.pageNumber = this.totalPages;
//         }
//         // set records to display on current page 
//         for (let i = (this.pageNumber - 1) * this.pageSize; i < this.pageNumber * this.pageSize; i++) {
//             if (i === this.totalRecords) {
//                 break;
//             }
//             this.recordsToDisplay.push(this.records[i]);
//         }
//     }

// }

import { LightningElement, api, wire, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/navigation'
import getRelatedFilesByRecordId from '@salesforce/apex/lwc_task2_apex.getRelatedFilesByRecordId'
// import nextPage from '@salesforce/apex/FileUploaderClass.nextPage'
// import previousPage from '@salesforce/apex/FileUploaderClass.previousPage'

const rLimit = 3;

export default class Task2Pagination extends NavigationMixin(LightningElement) {

    @api recordId;
    // @api docId = '/sfc/servlet.shepherd/document/download/';
    
    @api off;
    @api test = 0;
    prv = false;
    nxt = false;
    filesList =[];
    // chngOff = 0;
    // showImg = false;
    isLoading = false;

    connectedCallback(){
        this.off = 0;
        console.log('connected callback called = '+this.off);
        // eval("$A.get('e.force:refreshView').fire();");
    }

    handleUploadFinished(event) {
        // this.isLoading = true;
        // eval("$A.get('e.force:refreshView').fire();");
        // this.test += 1;
        const uploadedFiles = JSON.stringify(event.detail.files);
        console.log('uploadFileData = '+uploadedFiles);
        let uploadedFileNames = '';
        // for(let i = 0; i < uploadedFiles.length; i++) {
            uploadedFileNames += uploadedFiles.substring(uploadedFiles.indexOf('"name":"')+8, uploadedFiles.indexOf('",'));
            // this.showImg = true;
            console.log('uploadedFileName = '+uploadedFileNames);
        // }
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: uploadedFiles.length + ' Files uploaded Successfully: ' + uploadedFileNames,
                variant: 'success',
            }),
        );
        this.isLoading = true;
        console.log('isLoading = '+this.isLoading);
        // eval("$A.get('e.force:refreshView').fire();");
        this.test += 1;
        // this.off = 0;
    }

    previewHandler(event){
        console.log(event.target.dataset.id);
        this[NavigationMixin.Navigate]({ 
            type:'standard__namedPage',
            attributes:{ 
                pageName:'filePreview',
                actionName: 'view'
            },
            state:{ 
                selectedRecordId: event.target.dataset.id
            }
        })
    }

    next(event) {
        // console.log(event.target.dataset.id);
        console.log('In next '+this.off+rLimit);
        // console.log('off + rLimit = '+(this.off));
        this.off = this.off + rLimit;
        // this.off = this.chngOff;
        // this.RecordList();
    }

    previous(event) {
        // console.log(event.target.dataset.id);
        console.log('In previous = '+(this.off-rLimit));
        // console.log('off - rLimit = ');
        this.off = this.off - rLimit;
        // this.off = this.chngOff;
        // this.RecordList();
    }
    
    @wire(getRelatedFilesByRecordId, {recordId: '$recordId', offset : '$off', test : '$test'})
    RecordList({data, error}){ 
        if(data){ 
            console.log('isLoadinghello = '+this.isLoading);
            console.log(JSON.stringify(data));
            console.log('data'+data);
            this.filesList = Object.keys(data.imgMap).map(item=>({"label":data.imgMap[item],
             "value": item,
             "url":`/sfc/servlet.shepherd/document/download/${item}`
            }))
            this.prv = data.prev;
            this.nxt = data.next;
            // this.off = data.off;
            this.isLoading = data.isLoading;
            // this.totelRec = data.totelRec;
            console.log('FileList = ',this.filesList);
        }
        if(error){ 
            console.log(error);
        }
    }

}