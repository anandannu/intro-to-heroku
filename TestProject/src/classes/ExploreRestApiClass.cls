public class ExploreRestApiClass {
   
    public void execute () {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://trainingbcg-dev-ed.my.salesforce.com/services/data/v44.0/sobjects/Account');
        req.setMethod('POST');
        req.setHeader('Authorization', 'OAuth '+UserInfo.getSessionId());
        req.setHeader('content-type', 'application/json');
        req.setBody('{"Name":"Salesforce Rest APi"}');
        HttpResponse res = http.send(req);
    }
}