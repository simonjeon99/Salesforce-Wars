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
                        WrapperPerson person = getPeople(i);
                        // check if the people request is empty.
                        if(person.name ==  null){
                            System.debug('empty person');
                        }
                        else{
                            //perform creating people and inserting into org 
                            Contact newContact = new Contact();
                            newContact.Firstname = person.name.substringBefore(' ');
                            newContact.Lastname = person.name.substringAfter(' ');
                            if(person.height.isNumeric()){
                                newContact.Height__c = Decimal.ValueOf(person.height);
                            } else{
                                newContact.Height__c = null;
                            }
                            if(person.mass.isNumeric()){
                                newContact.Mass__c = Decimal.ValueOf(person.mass);
                            } else{
                                newContact.Mass__c = null;
                            }
                            newContact.Haircolor__c = person.hair_color;
                            newContact.Skincolor__c = person.skin_color;
                            newContact.Eyecolor__c = person.eye_color;
                            newContact.Birthyear__c = person.birth_year;
                            newContact.Gender__c = person.gender;
                            //newContact.Homeworld__c  = person.homeworld;
                            // newContact.Films__c = person.films;
                            // newContact.Species__c = person.species;
                            // newContact.Vehicles__c = person.vehicles;
                            // newContact.Starships__c = person.starships;
                            // newContact.Created__c = person.created;
                            // newContact.Edited__c = person.edited;
                            // newContact.Url__c = person.url;
                            
                            insert newContact;
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

    public static WrapperPerson getPeople(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/people/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        WrapperPerson person = new WrapperPerson();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            person = (WrapperPerson)  JSON.deserialize(responseBody, WrapperPerson.class);            
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
                        WrapperPlanet planet = getPlanets(i);
                        // check if the planet request is empty.
                        if(planet.name ==  null){
                            System.debug('empty planet');
                        }
                        else{
                            //perform creating planet and inserting into org 
                            Account newAccount = new Account();
                            newAccount.Name = planet.name;
                            if(planet.rotation_period.isNumeric()){
                                newAccount.Rotation__c = Decimal.ValueOf(planet.rotation_period);
                            } else{
                                newAccount.Rotation__c = null;
                            }
                            if(planet.orbital_period.isNumeric()){
                                newAccount.Orbital__c = Decimal.ValueOf(planet.orbital_period);
                            } else{
                                newAccount.Orbital__c = null;
                            }
                            if(planet.diameter.isNumeric()){
                                newAccount.Diameter__c = Decimal.ValueOf(planet.diameter);
                            } else{
                                newAccount.Diameter__c = null;
                            }
                            newAccount.Climate__c = planet.climate;
                            newAccount.Gravity__c = planet.gravity;
                            newAccount.Terrain__c = planet.terrain;
                            if(planet.surface_water.isNumeric()){
                                newAccount.Surface__c = Decimal.ValueOf(planet.surface_water);
                            } else{
                                newAccount.Surface__c = null;
                            }
                            if(planet.population.isNumeric()){
                                newAccount.NumberOfEmployees = Integer.ValueOf(planet.population);
                            } else{
                                newAccount.NumberOfEmployees = null;
                            }
                            // newAccount.Residents__c = planets.residents;
                            // newAccount.Films__c = planets.films;
                            // newAccount.Created__c = planet.created;
                            // newAccount.Edited__c = planet.edited;
                            // newAccount.Url__c = planet.url;

                            insert newAccount;
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

    public static WrapperPlanet getPlanets(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/planets/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        WrapperPlanet planet = new WrapperPlanet();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            planet = (WrapperPlanet)  JSON.deserialize(responseBody, WrapperPlanet.class);
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
                        WrapperFilm film  = getFilms(i);
                        // check if the film request is empty.
                        if(film.title ==  null){
                            System.debug('empty film');
                        }
                        else{
                            //perform creating film and inserting into org 
                            Film__c newFilm = new Film__c();
                            newFilm.Name =  film.title;
                            if(film.episode_id.isNumeric()){
                                newFilm.Episode__c = Integer.ValueOf(film.episode_id);
                            } else{
                                newFilm.Episode__c = null;
                            }
                            newFilm.Opening__c = film.opening_crawl;
                            newFilm.Director__c = film.director;
                            newFilm.Producer__c = film.producer;
                            newFilm.Release__c = date.ValueOf(film.release_date);
                            // newFilm.Characters__c = film.characters;
                            // newFilm.Planets__c = film.planets;
                            // newFilm.Starships__c = film.starships;
                            // newFilm.Vehicles__c = film.vehicles;
                            // newFilm.Species__c = film.species;
                            // newFim.Created__c = film.created;
                            // newFilm.Edited__c = film.edited;
                            // newFilm.Url__c = film.url;

                            insert newFilm;
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

    public static WrapperFilm getFilms(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/films/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        WrapperFilm film = new WrapperFilm();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            film = (WrapperFilm)  JSON.deserialize(responseBody, WrapperFilm.class);
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
                        WrapperSpecies specie = getSpecies(i);
                        // check if the species request is empty.
                        if(specie.name ==  null){
                            System.debug('empty species');
                        }
                        else{
                            Species__c newSpecies = new Species__c();
                            newSpecies.Name = specie.name;
                            newSpecies.Classification__c = specie.classification;
                            newSpecies.Designation__c = specie.designation;
                            if(specie.average_height.isNumeric()){
                                newSpecies.Average_Height__c = Integer.ValueOf(specie.average_height);
                            } else{
                                newSpecies.Average_Height__c = null;
                            }
                            newSpecies.Skincolors__c = specie.skin_colors;
                            newSpecies.Haircolors__c = specie.hair_colors;
                            newSpecies.Eyecolors__c = specie.eye_colors;
                            if(specie.average_lifespan.isNumeric()){
                                newSpecies.Average_Lifespan__c = Integer.ValueOf(specie.average_lifespan);
                            } else{
                                newSpecies.Average_Lifespan__c = null;
                            }
                            //newSpecies.Homeworld__c = specie.homeworld;
                            newSpecies.Language__c = specie.language;
                            //newSpecies.People__c = specie.people;
                            //newSpecies.Films__c = specie.films;
                            //newSpecies.Created__cs = specie.created;
                            //newSpecies.Edited__c; = specie.edited;
                            //newSpecies.Url__c; = specie.url;

                            insert newSpecies;
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

    public static WrapperSpecies getSpecies(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/species/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        WrapperSpecies species = new WrapperSpecies();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            species = (WrapperSpecies)  JSON.deserialize(responseBody, WrapperSpecies.class);
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
                        WrapperVehicle vehicle = getVehicles(i);
                        // check if the vehicle request is empty.
                        if(vehicle.name ==  null){
                            System.debug('empty vehicle');
                        }
                        else{
                            //perform creating vehicle and inserting into org 
                            Vehicle__c newVehicle = new Vehicle__c();
                            newVehicle.Name = vehicle.name;
                            newVehicle.Model__c = vehicle.model;
                            newVehicle.Manufacturer__c = vehicle.manufacturer;
                            if(vehicle.cost_in_credits.isNumeric()){
                                newVehicle.Cost_In_Credits__c = Integer.ValueOf(vehicle.cost_in_credits);
                            } else{
                                newVehicle.Cost_In_Credits__c = null;
                            }
                            if(vehicle.length.isNumeric()){
                                newVehicle.Length__c = Decimal.ValueOf(vehicle.length);
                            } else{
                                newVehicle.Length__c = null;
                            }
                            newVehicle.Max_Atmosphering_Speed__c = vehicle.max_atmosphering_speed;
                            newVehicle.Crew__c = vehicle.crew;
                            newVehicle.Passengers__c = vehicle.passengers;
                            if(vehicle.cargo_capacity.isNumeric()){
                                newVehicle.Cargo_Capacity__c = Integer.ValueOf(vehicle.cargo_capacity);
                            } else{
                                newVehicle.Cargo_Capacity__c = null;
                            }
                            newVehicle.Consumables__c = vehicle.consumables;
                            newVehicle.Class__c = vehicle.vehicle_class;
                            //newVehicle.Pilots__c = vehicle.pilots;
                            //newVehicle.Films__c = vehicle.films;
                            //newVehicle.Created__c = vehicle.created;
                            //newVehicle.Edited__c = vehicle.edited;
                            //newVehicle.Url__c = vehicle.url;

                            insert newVehicle;
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

    public static WrapperVehicle getVehicles(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/vehicles/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        WrapperVehicle vehicle = new WrapperVehicle();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            vehicle = (WrapperVehicle)  JSON.deserialize(responseBody, WrapperVehicle.class);
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
                        WrapperStarship starship = getStarships(i);
                        // check if the starship request is empty.
                        if(starship.name ==  null){
                            System.debug('empty starship');
                        }
                        else{
                            //perform creating starship and inserting into org 
                            Starship__c newStarship = new Starship__c();
                            newStarship.Name = starship.name;
                            newStarship.Model__c = starship.model;
                            newStarship.Manufacturer__c = starship.manufacturer;
                            if(starship.cost_in_credits.isNumeric()){
                                newStarship.Cost_In_Credits__c = Integer.ValueOf(starship.cost_in_credits);
                            } else{
                                newStarship.Cost_In_Credits__c = null;
                            }
                            if(starship.length.isNumeric()){
                                newStarship.Length__c = Decimal.ValueOf(starship.length);
                            } else{
                                newStarship.Length__c = null;
                            }
                            newStarship.Max_Atmosphering_Speed__c = starship.max_atmosphering_speed;
                            newStarship.Crew__c = starship.crew;
                            newStarship.Passengers__c = starship.passengers;
                            if(starship.cargo_capacity.isNumeric()){
                                newStarship.Cargo_Capacity__c = Integer.ValueOf(starship.cargo_capacity);
                            } else{
                                newStarship.Cargo_Capacity__c = null;
                            }
                            newStarship.Consumables__c = starship.consumables;
                            newStarship.Hyperdrive_Rating__c = starship.hyperdrive_rating;
                            if(starship.MGLT.isNumeric()){
                                newStarship.MGLT__c = Integer.ValueOf(starship.MGLT);
                            } else{
                                newStarship.MGLT__c = null;
                            }
                            newStarship.Class__c = starship.starship_class;
                            //newStarship.Pilots__c = starship.pilots;
                            //newStarship.Films__c = starship.films;
                            //newStarship.Created__c = starship.created;
                            //newStarship.Edited__c = starship.edited;
                            //newStarship.Url__c = starship.url;

                            insert newStarship;
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

    public static WrapperStarship getStarships(Integer Id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://swapi.dev/api/starships/' + String.valueOf(Id) + '/?format=json');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        WrapperStarship starship = new WrapperStarship();
        if(response.getStatusCode() == 200) {
            String responseBody =  response.getBody();
            starship = (WrapperStarship)  JSON.deserialize(responseBody, WrapperStarship.class);
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
