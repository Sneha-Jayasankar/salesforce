global class GetZoomMeetingURLwithInput {
   @InvocableMethod(label='Get Zoom Meeting URL with Input' description='Returns a meeting URL For Zoom')
   global static List<String> makeApiCalloutwithInput(List<String> inputZoomsParms)
   {
       String webLink;
      function(inputZoomsParms, webLink);
      system.debug('weblink='+webLink);
      return new List<String>{webLink};
   }
   
   @future(callout=true)
   public static void function (List<String> inputZoomsParms,String webLink) {
    HttpRequest req = new HttpRequest();
       Http http = new Http();
 
       req.setMethod('POST');
       req.setHeader('Content-Type','application/json');
       req.setHeader('Accept','*/*');
       req.setHeader('Accept-Encoding','gzip, deflate, br');

       String inTitle = '”Appointment Scheduled”';
       system.debug('inTitle =' + inTitle);   
       String inDate = '”' + inputZoomsParms.get(0) + '”';
       system.debug('inDate =' + inDate);                    
       req.setBody('{“topic”: “test create meeting”,”type”: “1”}');       

       System.debug('Body: ' + req.getBody());
       req.setEndpoint('callout:SFZoomAuth');
       System.debug('Endpoint Value: '+ req.getEndpoint());
       System.debug('Request: ' + req);
       HTTPResponse res = http.send(req);
       System.debug('Response Body: '+res.getBody());
       
       JSONParser parser = JSON.createParser(res.getBody());
       webLink = 'ZoomNotSetup';
       while (parser.nextToken() != null) {
       if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
       (parser.getText() == 'join_url')) {
           parser.nextToken();
           webLink = parser.getText();
           System.debug('join_url= ' + webLink);
           }
       }
   
   }
}