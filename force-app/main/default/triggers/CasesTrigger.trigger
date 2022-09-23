trigger CasesTrigger on Case(before insert) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) {
            CasesTriggerHandler.beforeInsert(Trigger.new);
        }
    }
}
