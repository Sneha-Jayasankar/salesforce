public class PatientController {
public Patient__c newPatient {get; set;}

    public PageReference saveandnew() {
        insert newPatient;
        PageReference PageRef = new PageReference('/apex/CreatePatient');
        newPatient.clear();
        return PageRef;
    }
}