public class ZoomMeetingCreation {
    
      @InvocableMethod(label='Get Zoom Meeting URL with Input' description='Returns a meeting URL For Zoom')
    public static void getZoomMeetingUrl(List<FlowInputs> inputValues) {
        
        ZoomCreateMeetingWrapper newWrapper = new ZoomCreateMeetingWrapper();
        Id appointmentId = inputValues[0].appointmentId;
        system.debug(appointmentId);
        newWrapper.topic = 'Consultation';
        newWrapper.type = 2;
        newWrapper.timezone = 'Asia/Kolkata';
        newWrapper.duration = 60;
        newWrapper.password = null;
        
        newWrapper.start_time = inputValues[0].meetingDetails;
        String jsonString = JSON.serialize(newWrapper);
        System.debug('jsonString >>'+jsonString);
        updateAppointment(jsonString,appointmentId);
    }
    
     	@Future(callout = true)
        public static void updateAppointment (String jsonString, String appointmentId){
            String webLink = ZoomCreateMeetingApi.createMeeting('me', jsonString);
            Appointment__c appointment = [SELECT Url__c from Appointment__c where id= :appointmentId];
                        system.debug('appointment: '+appointment);

            appointment.Url__c = weblink;
            system.debug('weblink: '+weblink);
            update appointment;
            system.debug('updated appointment: '+appointment);
        }
    
        public class FlowInputs{
    
        @InvocableVariable
        public String appointmentId;
        
        @InvocableVariable
        public String meetingDetails;
        
    }
}