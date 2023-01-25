public class DatabaseUpdateSchedule implements Schedulable{    
    public void execute(SchedulableContext sc){
        StarWarsController.GetPeople();
        StarWarsController.GetPlanets();
        StarWarsController.GetFilms();
        StarWarsController.getSpecies();
        StarWarsController.getStarships();
        StarWarsController.getVehicles();
    }
}