// import { LightningElement, track } from 'lwc';
// import getRecordsBySearch from '@salesforce/apex/lwc_task5_apex.getRecordsBySearch';
// import { sosl } from 'lightning/searchApi';

// export default class MyLwcComponent extends LightningElement {
//     @track searchKey = '';
//     @track objectOptions = [];
//     @track selectedObjects = [];
//     @track resultData = [];

//     connectedCallback() {
//         // Set Object Options
//         this.objectOptions = [
//             { label: 'Account', value: 'Account' },
//             { label: 'Opportunity', value: 'Opportunity' },
//             { label: 'User', value: 'User' },
//             { label: 'Contact' , value: 'Contact'}
//         ];
//     }

//     handleSearchKeyChange(event) {
//         this.searchKey = event.target.value;
//         // console.log('try1');

//         // console.log(searchKey);
//     }

//     handleObjectChange(event) {
//         this.selectedObjects = event.detail.value;
//         // console.log('try2');
//         // console.log(selectedObjects);
//     }

//     handleSearchClick() {
//         getRecordsBySearch({ searchKey: this.searchKey, objectNames: this.selectedObjects })
//             .then(result => {
//                 const resultData = [];
//                 for (const objName in result) {

//                     const data = result[objName];
//                     resultData.push({
//                         key: objName,
//                         label: objName,
//                         data
//                     });
//                     // console.log('search oooo');
//                     // console.log(key , label , data);
//                 }
//                 this.resultData = resultData;
//                 // console.log('result data');
//                 // console.log(this.resultData);
//             })
//             .catch(error => {
//                 // eslint-disable-next-line no-console
//                 console.error('Error in fetching records', JSON.stringify(error));
//             });
//     }
// // }


import { LightningElement, track } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getRecords from '@salesforce/apex/lwc_task5_apex.getRecords';
export default class lwc_task5 extends LightningElement {
    @track searchKey = '';
    @track objectsList = [
        { label: 'Account', value: 'Account' },
        { label: 'Contact', value: 'Contact' },
        { label: 'Opportunity', value: 'Opportunity' },
        { label: 'Lead', value: 'Lead' }
    ];
    @track selectedObjects = [];
    @track records;
    handleSearchKeyChange(event){
        this.searchKey = event.target.value;
    }
    handleSelectionChange(event){
        this.selectedObjects = event.detail.value;
    }
    handleSearch(){
        getRecords({ searchKey: this.searchKey, selectedObjects: this.selectedObjects })
            .then(result => {
                if(result.length > 0){
                    this.records = result;
                } else {
                    this.records = undefined;
                    const toastEvent = new ShowToastEvent({
                        title : 'No Records Found',
                        message : 'No Records Found for the searched data',
                        variant : 'error',
                    });
                    this.dispatchEvent(toastEvent);
                }
                
            })
            .catch(error => {
                this.records = undefined;
                const toastEvent = new ShowToastEvent({
                    title : 'Error Occurred',
                    message : error.body.message,
                    variant : 'error',
                });
                this.dispatchEvent(toastEvent);
            });
    }
}

