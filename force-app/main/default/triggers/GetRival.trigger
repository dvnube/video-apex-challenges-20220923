// Automatically populate a lookup field to the Rival object
trigger GetRival on Account (after insert, after update) {
    for (Account acc : Trigger.new) {
      // Find the Rival record based on the picklist value
      Rival__c comp = [SELECT Id, Name
                         FROM Rival__c
                        WHERE Name = acc.Rival_Picklist__c];
  
      // Rival__c is a lookup to the Rival custom object
      acc.Rival__c  = comp.Name; 
    }
}