// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

public class PeopleCallouts{
    public void getPeople(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/people/11/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> person = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            for(String key: person.keySet()){
                System.debug(person.get(key));
            }
        }
    }
}

PeopleCallouts test = new PeopleCallouts();
test.getPeople();