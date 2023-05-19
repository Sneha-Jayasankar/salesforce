global class BatchAppointmentUpdate implements Database.Batchable<sObject> {
	
	global Database.QueryLocator start(Database.BatchableContext BC) {
		String stage = 'Booked';
		String query = 'SELECT Name,Stages__c from Appointment__c where Stages__c = :stage and Date_Time__c = TODAY'; 	
		return Database.getQueryLocator(query);
	}
	
	global void execute(Database.BatchableContext BC, List<Appointment__c> scope) {
		for(Appointment__c a : scope) {
			a.Stages__c = 'No Show';
		}
		update scope;
	}
	
	global void finish(Database.BatchableContext BC) {
	}
}