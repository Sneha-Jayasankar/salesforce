public class ScheduleAppointmentUpdate {
    public ScheduleAppointmentUpdate(ApexPages.StandardSetController controller) {
        
    } 
    public  PageReference scheduleAppointmentUpdate() {
    BatchAppointmentUpdate bau = new BatchAppointmentUpdate();
        try{
        ID batchprocessid = Database.executeBatch(bau,200);
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM,'Appointments updated successfully.'));
             return redirectToList();
        }
        catch(Exception e) {
            System.debug('Error thrown is: '+e.getMessage());
                        ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,'Appointments could not be updated'));
             return redirectToList();
        }
    }
	public PageReference redirectToList() { 
     return new ApexPages.Action('{!List}').invoke();
	}

}