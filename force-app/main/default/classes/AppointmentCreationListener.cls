@RestResource(urlMapping='/AppointmentCreation')
global class AppointmentCreationListener {

    @httpPost
    global static void getPayload(){
        RestRequest req = RestContext.request;
        Blob body = req.requestBody;
        String requestString = body.toString();
        Appointment__c appointment = (Appointment__c)JSON.deserialize(requestString, Appointment__c.Class);
         try{
        insert appointment;
        system.debug('Created appointment is ' + appointment);   
        }
        catch(DmlException e) {
           RestResponse res = RestContext.response;
            res.statusCode = 500;
            //res.responseBody = blob.valueOf(e.getDmlMessage(0));
            String jsonResponse = '{"status": "Failure"'+ ',\n"Error": "' + e.getDmlMessage(0) + '"}';
            res.responseBody = blob.valueOf(jsonResponse); 
        }         
    }
}