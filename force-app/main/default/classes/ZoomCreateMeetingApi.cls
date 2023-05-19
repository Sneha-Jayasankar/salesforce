Public class ZoomCreateMeetingApi {
  
    public static String createMeeting(String userEmail,String jsonString) {
        System.debug('json>>'+jsonString);
        String endPoint = 'callout:Zoom/users/'+userEmail+'/meetings';
        HttpRequest req = new HttpRequest();
        req.setBody(jsonString);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');
        req.setEndpoint(endPoint); 
        Http http = new Http();
        HttpResponse res = http.send(req);
         
        if(res.getStatusCode() == 201){
            System.debug('res pass >>>' +res.getBody());            
        }else{
            System.debug('res fail >>>' +res);
        }
        
        JSONParser parser = JSON.createParser(res.getBody());
        String webLink;
        webLink = 'ZoomNotSetup'; 
        while (parser.nextToken() != null) {
       if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'join_url')) {
			parser.nextToken();
			webLink = parser.getText();
			System.debug('join_url= ' + webLink);
           }
       }
  	 return webLink;
    }
}