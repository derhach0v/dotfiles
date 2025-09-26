
public with sharing class AccountHelper {

public static String getAccountName(Id accountId) {
    if (accountId == null) {
        return 'No Account';
    }
    
    Account account = [SELECT Name FROM Account WHERE Id = :accountId LIMIT 1];
    
    if (account != null) {
        return account.Name;
    } else {
        return 'Account Not Found';
    }
}
}
