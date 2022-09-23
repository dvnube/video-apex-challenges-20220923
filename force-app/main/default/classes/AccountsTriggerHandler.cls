/*
    This solution will only work if the Name field is unique (Rival object)
*/

public without sharing class AccountsTriggerHandler {
    public static void beforeInsert(List<Account> records) {
        Map<String, Rival__c> rivals = generateMapByName([SELECT Id FROM Rival__c WHERE Name IN :getSetString(records, Account.Rival_Picklist__c)]);
        for (Account record : records) {
            beforeInsert(record, rivals.get(record.Rival_Picklist__c));
        }
    }
    
    public static void beforeUpdate(List<Account> records, Map<Id, Account> oldMap) {
        Map<String, Rival__c> rivals = generateMapByName([SELECT Id FROM Rival__c WHERE Name IN :getSetString(records, Account.Rival_Picklist__c)]);
        for (Account record : records) {
            beforeUpdate(record, oldMap.get(record.Id), rivals.get(record.Rival_Picklist__c));
        }
    }

    private static void beforeInsert(Account record, Rival__c rival) {
        handleUpdateFields(record, rival);
    }

    private static void beforeUpdate(Account record, Account oldRecord, Rival__c rival) {
        handleUpdateFields(record, oldRecord, rival);
    }

    private static void handleUpdateFields(Account record, Rival__c rival) {
        updateRivalFields(record, rival);
    }

    private static void handleUpdateFields(Account record, Account oldRecord, Rival__c rival) {
        updateRivalFields(record, oldRecord, rival);
    }

    private static void updateRivalFields(Account record, Rival__c rival) {
        if (rival != null) {
            record.Rival__c = rival.Id;
        }
    }

    private static void updateRivalFields(Account record, Account oldRecord, Rival__c rival) {
        if (String.isBlank(record.Rival__c) && rival != null) {
            //update
        } else if (String.isNotBlank(record.Rival__c) && rival != null) {
            if (record.Rival__c != oldRecord.Rival__c) {
                //update
            }
        } else if (String.isNotBlank(record.Rival__c) && rival == null) {
            //update
        }
    }

    private static Set<String> getSetString(List<Account> records, Schema.SObjectField fieldStr) {
        Set<String> value = new Set<String>();

        for (List<Account> record : records) {
            value.add((String)record.get(fieldStr));
        }

        return value;
    }

    private static Map<String, Rival__c> generateMapByFieldStr(List<Rival__c> rivals, Schema.SObjectField fieldStr) {
        Map<String, Rival__c> value = new Map<String, Rival__c>();

        for (Rival__c rival : rivals) {
            value.put((String)rival.get(fieldStr), rival);
        }

        return value;
    }
}
