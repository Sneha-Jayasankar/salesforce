public class BatchUpdateFlow {

    @InvocableMethod(label='Update Appointments' description='Updates appointments with status as "No Show"')
    public static void updateAppointment() {
        BatchAppointmentUpdate bau = new BatchAppointmentUpdate();
        try{
        ID batchprocessid = Database.executeBatch(bau);
        }
        catch(Exception e) {
            System.debug('Error thrown is: '+e.getMessage());
        }
    }
}