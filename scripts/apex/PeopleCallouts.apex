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
        request.setEndpoint('https://swapi.dev/api/people/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> people = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            Integer num = (Integer) people.get('count');
            System.debug('printing');
            for(Integer i = 1; i <= num; i++){
                System.debug(getPeople(i));
            }
        }
    }

    public void getHomeWorld(){

    }

    public void getFilms(){

    }

    public void getSpecies(){

    }

    public void getVehicles(){

    }
    
    public void getStarships(){

    }

    public List<Object> getPeople(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/people/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        List<Object> values = new List<Object>();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> person = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(person.keySet());
            values.add(String.valueOf(Id));
            for(String key: keys){
                values.add(person.get(key));
            }
        }
        return values;
    }

    public void getHomeWorld(String homeworld){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(homeworld + '?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> hw = (Map<String, Object>)JSON.deserializeUntyped(responseBody);
            List<String> keys = new List<String>(hw.keySet());
            List<Object> values = new List<Object>();
            for(String key: keys){
                values.add(hw.get(key));
            }
        }
    }

    public void getFilms(List<String> films){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        for(String film : films){
            request.setEndpoint(film + '?format=json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> f = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(f.keySet());
            List<Object> values = new List<Object>();
            for(String key: keys){
                values.add(f.get(key));
            }

        }

        }
    }

    public void getSpecies(List<String> species){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        for(String spec : species){
            request.setEndpoint(spec + '?format=json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> s = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(s.keySet());
            List<Object> values = new List<Object>();
            for(String key: keys){
                values.add(s.get(key));
            }

        }
        }
    }
    
    public void getVehicles(List<String> vehicles){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        for(String vehicle : vehicles){
            request.setEndpoint(vehicle + '?format=json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> v = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(v.keySet());
            List<Object> values = new List<Object>();
            for(String key: keys){
                values.add(v.get(key));
            }

        }
        }
    }
    
    public void getStarships(List<String> starships){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        for(String starship : starships){
            request.setEndpoint(starship + '?format=json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> star = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(star.keySet());
            List<Object> values = new List<Object>();
            for(String key: keys){
                values.add(star.get(key));
            }

        }
        }
    }
}

PeopleCallouts test = new PeopleCallouts();
test.getPeople();