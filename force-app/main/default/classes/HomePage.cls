public  class HomePage {
    public List<Patient__c>  patlists{set;get;}
     public List<Doctor__c>  doclists{set;get;}
     
   public HomePage()
   {
      patlists=[Select id,name From Patient__c];
      doclists=[select id,name from Doctor__c];
}
}