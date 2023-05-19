import { LightningElement, track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import patient from '@salesforce/schema/Patient__c';
import nameField from '@salesforce/schema/Patient__c.Name';
import emailField from '@salesforce/schema/Patient__c.Email__c';
import bloodGroup from '@salesforce/schema/Patient__c.Blood_Group__c';
import dateOfBirth from '@salesforce/schema/Patient__c.Date_Of_Birth__c';
import gender from '@salesforce/schema/Patient__c.Gender__c';
import phoneNumber from '@salesforce/schema/Patient__c.Phone_Number__c';
import photo from '@salesforce/schema/Patient__c.Patient_Photo__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class CreatePatient extends LightningElement {

    patientObject = patient;
    myFields = [nameField, emailField,bloodGroup,dateOfBirth,gender,phoneNumber,photo];
    @track showLoading = false;
    handlePatientCreated() {
           const recordInput = { 'apiName': 'Patient__c', myFields };
           // console.log(recordInput);
            createRecord(recordInput)
                .then(patientObject => {
                    this.patientId=patientObject.id;
                    this.showToast('Success!!', 'Patient created successfully!!', 'success', 'dismissable');
                    
                    // Display fresh data in the form
                    this.showLoading = false;
                    this[NavigationMixin.Navigate]({
                                                type: 'standard__recordPage',
                                                attributes: {
                                                    recordId: patientObject.id,
                                                    objectApiName: 'Patient__c',
                                                    actionName: 'view'
                                                },
                                            });
                })
                .catch(error => {
                    this.showLoading = false;
                    console.log(error);
                    this.showToast('Error!!', error.body.message, 'error', 'dismissable');
                });
        }
    
    showToast(title, message, variant, mode) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
            mode: mode
        });
        this.dispatchEvent(evt);
    }
}