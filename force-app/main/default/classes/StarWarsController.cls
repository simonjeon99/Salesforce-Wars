public with sharing class StarWarsController {
    @future (callout = true)
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
            for(Integer i = 1; i <= num; i++){
                System.debug(getPeople(i));
            }
        }
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

    public void getPlanets(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/planets/?format=json');
        request.setMethod('GET');
        HttpResponse reponse = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> planet = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            Integer num = (Integer) planet.get('count');
            for(Integer i = 1; i <= num; i++){
                System.debug(getPlanets(i));
            }
        }
    }

    public List<Object> getPlanets(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/planets/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        List<Object> values = new List<Object>();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> planet = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(planet.keySet());
            values.add(String.valueOf(Id));
            for(String key: keys){
                values.add(planet.get(key));
            }
        }
        return values;
    }

    public void getFilms(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/films/?format=json');
        request.setMethod('GET');
        HttpResponse reponse = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> film = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            Integer num = (Integer) film.get('count');
            for(Integer i = 1; i <= num; i++){
                System.debug(getFilms(i));
            }
        }
    }

    public List<Object> getFilms(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/films/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        List<Object> values = new List<Object>();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> film = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(film.keySet());
            values.add(String.valueOf(Id));
            for(String key: keys){
                values.add(film.get(key));
            }
        }
        return values;
    }

    public void getSpecies(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/species/?format=json');
        request.setMethod('GET');
        HttpResponse reponse = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> species = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            Integer num = (Integer) species.get('count');
            for(Integer i = 1; i <= num; i++){
                System.debug(getSpecies(i));
            }
        }
    }

    public List<Object> getSpecies(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/species/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        List<Object> values = new List<Object>();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> species = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(species.keySet());
            values.add(String.valueOf(Id));
            for(String key: keys){
                values.add(species.get(key));
            }
        }
        return values;
    }


    public void getVehicles(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/vehicles/?format=json');
        request.setMethod('GET');
        HttpResponse reponse = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> vehicle = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            Integer num = (Integer) vehicle.get('count');
            for(Integer i = 1; i <= num; i++){
                System.debug(getVehicles(i));
            }
        }
    }

    public List<Object> getVehicles(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/vehicles/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        List<Object> values = new List<Object>();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> vehicle = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(vehicle.keySet());
            values.add(String.valueOf(Id));
            for(String key: keys){
                values.add(vehicle.get(key));
            }
        }
        return values;
    }
    
    public void getStarships(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/starships/?format=json');
        request.setMethod('GET');
        HttpResponse reponse = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> starship = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            Integer num = (Integer) starship.get('count');
            for(Integer i = 1; i <= num; i++){
                System.debug(getStarships(i));
            }
        }
    }

    public List<Object> getStarships(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/starships/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        List<Object> values = new List<Object>();
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> starship = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
            List<String> keys =  new List<String>(starship.keySet());
            values.add(String.valueOf(Id));
            for(String key: keys){
                values.add(starship.get(key));
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

    public void getFilmname(List<String> films){
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

    public void getSpeciesname(List<String> species){
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
    
    public void getVehiclesname(List<String> vehicles){
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
    
    public void getStarshipsname(List<String> starships){
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
