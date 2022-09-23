trigger CasesTrigger on Case(after insert) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            CasesTriggerHandler.afterInsert(Trigger.new);
        }
    }
}
