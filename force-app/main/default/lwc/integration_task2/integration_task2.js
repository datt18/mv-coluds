import { LightningElement, track } from 'lwc';
import { uploadDocumentToDropbox } from '@salesforce/apex/DropboxIntegrationController.uploadDocumentToDropbox';
import Upload from "@salesforce/apex/integration_task2_apex.Upload";

export default class DropboxIntegration extends LightningElement {
    @track file;
    @track hasError = false;
    @track isUploaded = false;
    @track errorMessage;
    handleFilesChange(event){
        this.file = event.target.files[0];
    }
    handleDropboxUpload(){
        if(this.file){
            let fr = new FileReader();
            fr.onload = (function(){
                let fileContent = fr.result;
                Upload({documentName: this.file.name, documentContent: fileContent})
                    .then(result => {
                        this.isUploaded = true;
                    })
                    .catch(error => {
                        this.hasError = true;
                        this.errorMessage = error.body.message;
                    });
            }).bind(this);
            fr.readAsDataURL(this.file);
        }
    }
}
