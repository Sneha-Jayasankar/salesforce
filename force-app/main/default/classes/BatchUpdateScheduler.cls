global class BatchUpdateScheduler implements Schedulable {

    global void execute(SchedulableContext ctx){
         BatchAppointmentUpdate bau = new BatchAppointmentUpdate();
        try{
        ID batchprocessid = Database.executeBatch(bau,200);
        }
        catch(Exception e) {
            System.debug('Error thrown is: '+e.getMessage());
        }
    }
}