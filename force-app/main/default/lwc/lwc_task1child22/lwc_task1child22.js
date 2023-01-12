import { LightningElement,api} from 'lwc';
export default class lwc_task1child22 extends LightningElement {   
    @api recordId;   
    
    /*
        This method is handler for refreshlist event which is raised by 
        attachment-upload-component. It will search for attachment-related-list in the DOM
        and call refreshList method passing linkedEntityId as argument
    */
    delegateRefreshingAttachmentList(event) {                
        let args = JSON.parse(JSON.stringify(event.detail));
        let linkedEntityId = args.linkedinEntityId;        
        this.template.querySelector('c-lwc_task1child').refreshList(linkedEntityId);
    }
}