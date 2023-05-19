public class DoctorController {

public Doctor__c newDoctor {get; set;}
    
    public Doctorcontroller(){
    newDoctor = new Doctor__c();
    }
    
    public PageReference save() {
        insert newDoctor;
        PageReference PageRef = new PageReference('/'+newDoctor.Id);
    	newDoctor.clear();
        return PageRef;
    }
    
    public PageReference saveandnew() {
    insert newDoctor;
    PageReference PageRef = new PageReference('/apex/Doctor');
    newDoctor.clear();
    return PageRef;
    }
    
     public PageReference cancel() {
        PageReference PageRef = new PageReference('/a00');
        return PageRef;
    }

}