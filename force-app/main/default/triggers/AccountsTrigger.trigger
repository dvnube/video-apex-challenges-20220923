trigger AccountsTrigger on Account (before insert, before update) {
    if (Trigger.isBefore && Trigger.isInsert) {
        AccountsTriggerHandler.beforeInsert(Trigger.new)
    } else if (Trigger.isBefore && Trigger.isUpdate) {
        AccountsTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
    }
}