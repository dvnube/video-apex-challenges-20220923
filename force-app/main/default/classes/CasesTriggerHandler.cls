public without sharing class CasesTriggerHandler {
    static final String STATUS_CLOSED = 'Closed';
    static final String ID_DAVID_LIU_STR = IdsImportantUsers__c.getOrgDefaults()?.DavidLiu__c;

    public static void afterInsert(List<Case> records) {
        List<Case> casesToAutoAcceptClose = new List<Case>();

        for (Case record : records) {
            afterInsert(record, casesToAutoAcceptClose);
        }

        update casesToAutoAcceptClose;
    }

    private static void afterInsert(Case record, List<Case> casesToAutoAcceptClose) {
        handleAutoAcceptClose(record, casesToAutoAcceptClose);
    }

    private static void handleAutoAcceptClose(Case record, List<Case> casesToAutoAcceptClose) {
        if (String.isNotBlank(ID_DAVID_LIU_STR)) {
            casesToAutoAcceptClose.add(new Case(Id = record.Id, Status = STATUS_CLOSED, Owner = ID_DAVID_LIU_STR));
        }
    }
}
