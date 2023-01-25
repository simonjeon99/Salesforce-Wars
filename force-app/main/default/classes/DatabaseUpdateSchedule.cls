global class DatabaseUpdateSchedule implements Schedulable{
    public static String SCHED_TIME = '0 0 9 * * ?';
    
    global void execute(SchedulableContext sc){
        Account[] accList = [SELECT ID__c FROM Account];
        Contact[] conList = [SELECT ID__c FROM Contact];
        Film__c[] filmList = [SELECT ID__c FROM Film];
        Species__c[] specList = [SELECT ID__c FROM Species__c];
        Starship__c[] starList = [SELECT ID__c FROM Starship__c];
        Vehicle__c[] vehList = [SELECT ID__c FROM Vehicle__c];


    }
}