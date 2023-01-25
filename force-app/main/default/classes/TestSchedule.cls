@IsTest
private class TestSchedule{
    static testMethod void TestingUpdate(){
        Test.startTest();
        DatabaseUpdateSchedule db = new DatabaseUpdateSchedule();
        String SCHED_TIME = '0 0 9 * * ?';
        String jobID = System.schedule('Update Job', SCHED_TIME, db);
        Test.stopTest();
    }
}
