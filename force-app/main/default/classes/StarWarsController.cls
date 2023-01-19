public with sharing class StarWarsController {
    @future (callout = true)
    public static void getPeople(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/people/?format=json');
        request.setMethod('GET');
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> people = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                Integer num = (Integer) people.get('count');
                for(Integer i = 1; i <= num; i++){
                    try{
                        wrapperPerson person = getPeople(i);
                        // check if the people request is empty.
                        if(person.name ==  null){
                            System.debug('empty person');
                        }
                        else{
                            //perform creating people and inserting into org 
                        }
                    } catch(DmlException e){
                        System.debug('Error in inserting people: ' + e);
                    }
                }
            }
        } catch(System.CalloutException e){
            System.debug('Error in getting people: ' + e);
        }
    }

    public static wrapperPerson getPeople(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/people/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        wrapperPerson person = new wrapperPerson();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            person = (wrapperPerson)  JSON.deserialize(responseBody, wrapperPerson.class);            
        }
        return person;
    }

    @future (callout = true)
    public static void getPlanets(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/planets/?format=json');
        request.setMethod('GET');
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> planets = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                Integer num = (Integer) planets.get('count');
                for(Integer i = 1; i <= num; i++){
                    try{
                        wrapperPlanet planet = getPlanets(i);
                        // check if the planet request is empty.
                        if(planet.name ==  null){
                            System.debug('empty planet');
                        }
                        else{
                            //perform creating planet and inserting into org 
                        }
                    } catch(DmlException e){
                        System.debug('Error in inserting planets: ' + e);
                    }
                }
            }
        } catch(System.CalloutException e){
            System.debug('Error in getting planets: ' + e);
        }
    }

    public static wrapperPlanet getPlanets(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/planets/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        wrapperPlanet planet = new wrapperPlanet();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            planet = (wrapperPlanet)  JSON.deserialize(responseBody, wrapperPlanet.class);
        }
        return planet;
    }

    @future (callout = true)
    public static void getFilms(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/films/?format=json');
        request.setMethod('GET');
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> films = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                Integer num = (Integer) films.get('count');
                for(Integer i = 1; i <= num; i++){
                    try{
                        wrapperFilm film  = getFilms(i);
                        // check if the film request is empty.
                        if(film.title ==  null){
                            System.debug('empty film');
                        }
                        else{
                            //perform creating film and inserting into org 
                        }
                    } catch(DmlException e){
                        System.debug('Error in inserting film: ' + e);
                    }
                }
            }
        } catch(System.CalloutException e){
            System.debug('Error in getting films: ' + e);
        }
    }

    public static wrapperFilm getFilms(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/films/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        wrapperFilm film = new wrapperFilm();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            film = (wrapperFilm)  JSON.deserialize(responseBody, wrapperFilm.class);
        }
        return film;
    }

    @future (callout = true)
    public static void getSpecies(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/species/?format=json');
        request.setMethod('GET');
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> species = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                Integer num = (Integer) species.get('count');
                for(Integer i = 1; i <= num; i++){
                    try{
                        wrapperSpecies specie = getSpecies(i);
                        // check if the species request is empty.
                        if(specie.name ==  null){
                            System.debug('empty species');
                        }
                        else{
                            //perform creating species and inserting into org 
                        }
                    } catch(DmlException e){
                        System.debug('Error in getting inserting species ' + e);
                    }
                }
            }
        } catch(System.CalloutException e){
            System.debug('Error in getting species' + e);
        }
    }

    public static wrapperSpecies getSpecies(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/species/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        wrapperSpecies species = new wrapperSpecies();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            species = (wrapperSpecies)  JSON.deserialize(responseBody, wrapperSpecies.class);
        }
        return species;
    }

    @future (callout = true)
    public static void getVehicles(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/vehicles/?format=json');
        request.setMethod('GET');
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> vehicles = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                Integer num = (Integer) vehicles.get('count');
                for(Integer i = 1; i <= num; i++){
                    try{
                        wrapperVehicle vehicle = getVehicles(i);
                        // check if the vehicle request is empty.
                        if(vehicle.name ==  null){
                            System.debug('empty vehicle');
                        }
                        else{
                            //perform creating vehicle and inserting into org 
                        }
                    } catch(DmlException e){
                        System.debug('Error in getting inserting vehicles ' + e);
                    }
                }
            }
        } catch(System.CalloutException e){
            System.debug('Error in getting vehicles ' + e);
        }
    }

    public static wrapperVehicle getVehicles(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/vehicles/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        wrapperVehicle vehicle = new wrapperVehicle();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            vehicle = (wrapperVehicle)  JSON.deserialize(responseBody, wrapperVehicle.class);
        }
        return vehicle;
    }
    
    @future (callout = true)
    public static void getStarships(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/starships/?format=json');
        request.setMethod('GET');
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> starships = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                Integer num = (Integer) starships.get('count');
                for(Integer i = 1; i <= num; i++){
                    try{
                        wrapperStarship starship = getStarships(i);
                        // check if the starship request is empty.
                        if(starship.name ==  null){
                            System.debug('empty starship');
                        }
                        else{
                            //perform creating starship and inserting into org 
                        }
                    } catch(DmlException e){
                        System.debug('Error in inserting starships ' + e);
                    }
                }
            }
        } catch(System.CalloutException e){
            System.debug('Error in getting starships ' + e);
        }
    }

    public static wrapperStarship getStarships(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/starships/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        wrapperStarship starship = new wrapperStarship();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            starship = (wrapperStarship)  JSON.deserialize(responseBody, wrapperStarship.class);
        }
        return starship;
    }

    public static String getHomeWorld(String homeworld){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(homeworld + '?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String name;
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            Map<String, Object> hw = (Map<String, Object>)JSON.deserializeUntyped(responseBody);
            name = (String) hw.get('name');
        }
        return name;
    }

    public static List<String> getFilmname(List<String> films){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        List<String> title =  new List<String>();
        for(String film : films){
            request.setEndpoint(film + '?format=json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> f = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                title.add((String)f.get('title'));
            }
        }
        return title;
    }

    public static List<String> getSpeciesname(List<String> species){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        List<String> name =  new List<String>();
        for(String spec : species){
            request.setEndpoint(spec + '?format=json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> s = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                name.add((String)s.get('name'));
            }
        }
        return name;
    }
    
    public static List<String> getVehiclesname(List<String> vehicles){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        List<String> name =  new List<String>();
        for(String vehicle : vehicles){
            request.setEndpoint(vehicle + '?format=json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> v = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                name.add((String)v.get('name'));
            }
        }
        return name;
    }
    
    public static List<String> getStarshipsname(List<String> starships){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        List<String> name =  new List<String>();
        for(String starship : starships){
            request.setEndpoint(starship + '?format=json');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                String responseBody =  response.getBody();
                Map<String, Object> star = (Map<String, Object>)  JSON.deserializeUntyped(responseBody);
                name.add((String)star.get('name'));
            }
        }
        return name;
    }
}
