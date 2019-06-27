public class CustomExceptionController {
    public static void throwCustomException() {
        try {
            throw new customDemoException('This is Custom Exception Message');
        }
        catch(Exception ex) {
            System.debug('Custom Exception Message ===> '+ex.getMessage());
        }
    }
// custom exception class
public class customDemoException extends Exception {}
}