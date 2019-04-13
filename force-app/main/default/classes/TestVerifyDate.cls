@isTest
private class TestVerifyDate {
    //test date in range
    @isTest
    static void testDate2IntoRange(){
        Date date1 = Date.newInstance(2019, 4, 10);
        Date date2 = Date.newInstance(2019, 4, 17);
        System.assertEquals(date2, VerifyDate.CheckDates(date1, date2));
    }
    //test date not in range
    @isTest
    static void testDate2NotInRange(){
        Date date1 = Date.newInstance(2019, 4, 10);
        Date date2 = Date.newInstance(2019, 12, 31);
        Date expectedDate = Date.newInstance(date1.year(), date1.month(), Date.daysInMonth(date1.year(), date1.month()));
        System.assertEquals(expectedDate, VerifyDate.CheckDates(date1, date2));
    }
}