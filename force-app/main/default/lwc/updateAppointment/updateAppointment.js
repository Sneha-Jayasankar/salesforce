import { LightningElement,track, wire } from 'lwc';
import scheduleAppointmentUpdate from '@salesforce/apex/ScheduleAppointmentUpdateLwc.scheduleAppointmentUpdate';
export default class UpdateAppointment extends LightningElement {
    //Boolean tracked variable to indicate if modal is open or not default value is false as modal is closed when page is loaded 
    @track isModalOpen = false;
   // @wire (scheduleAppointmentUpdate)
    openModal() {
        this.isModalOpen = true;
    }
    closeModal() {
        this.isModalOpen = false;
    }
    submitDetails() {
        scheduleAppointmentUpdate();
        this.isModalOpen = false;
    }
}