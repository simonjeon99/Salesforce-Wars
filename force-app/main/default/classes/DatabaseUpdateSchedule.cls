global class DatabaseUpdateSchedule implements Schedulable{
    public static String SCHED_TIME = '0 0 9 * * ?';
    
    global void execute(SchedulableContext sc){
        Contact[] conList = [SELECT Firstname, Lastname, FIELDS(CUSTOM) FROM Contact];
        Account[] accList = [SELECT Name, FIELDS(CUSTOM) FROM Account];
        Film__c[] filmList = [SELECT Name, FIELDS(CUSTOM) FROM Film];
        Species__c[] specList = [SELECT Name, FIELDS(CUSTOM) FROM Species__c];
        Starship__c[] starList = [SELECT Name, FIELDS(CUSTOM) FROM Starship__c];
        Vehicle__c[] vehList = [SELECT Name, FIELDS(CUSTOM) FROM Vehicle__c];

        StarwarsController newControl = new StarwarsController();
        newControl.GetPeople();
        newControl.GetPlanets();
        newControl.GetFilms();
        newControl.getSpecies();
        newControl.getStarships();
        newControl.getVehicles();
    }
}