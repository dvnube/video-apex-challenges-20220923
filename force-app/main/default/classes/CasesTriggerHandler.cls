public without sharing class CasesTriggerHandler {
    static final String STATUS_CLOSED = 'Closed';
    static final String ID_DAVID_LIU_STR = IdsImportantUsers__c.getOrgDefaults()?.DavidLiu__c;

    public static void beforeInsert(List<Case> records) {
        for (Case record : records) {
            beforeInsert(record);
        }
    }

    private static void beforeInsert(Case record) {
        handleUpdateFields(record);
    }
    
    private static void handleUpdateFields(Case record) {
        handleAutoAcceptClose(record);
    }

    private static void handleAutoAcceptClose(Case record) {
        if (String.isNotBlank(ID_DAVID_LIU_STR)) {
            case.Status = STATUS_CLOSED;
            case.Owner = ID_DAVID_LIU_STR;
        }
    }
}
