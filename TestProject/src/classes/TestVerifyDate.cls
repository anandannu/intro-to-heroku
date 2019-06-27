@istest
public class TestVerifyDate {
	
    @isTest static void verifyDate1() {       
         Date Date1 = date.today();
         Date Date2 = Date1.addDays(29);
         Date D = VerifyDate.CheckDates(Date1,Date2);
         System.assertEquals(Date2, D); 
    }
    @isTest static void verifyDate2() {       
         Date Date1 = date.today();
         Date Date2 = Date1.addDays(31);
         Date D = VerifyDate.CheckDates(Date1,Date2);
         System.assertNotEquals(Date1, D); 
    }
}