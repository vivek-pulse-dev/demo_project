
#### Exception Handling
    Never do a 'catch exception and do nothing'. Hiding an exception means you will never know it occurred. In the worst case, explicitly log the exception.
    
    Catch Specific Exceptions: Always catch specific exceptions (like SocketException, FormatException) before falling back to generic Exception.
## rethrow ?????
#    Good:

    dart
    
    void readFromFile(String fileName) {
    try {
            // read from file.
        } on FileSystemException catch (e) {
            // Log file-specific error
            Logger.logError(e.message);
            rethrow;
        }
    }
#    Not Good:

    dart
    
    void readFromFile(String fileName) {
    try {
        // read from file.
    } catch (e) {
        // Catching general exception is bad... we will never know whether
        // it was a file error or some other error.
        return; // Hiding the exception entirely
        }
    }
    Preserve the Stack Trace: When you rethrow an exception, use the rethrow keyword instead of throw e. This preserves the original call stack, making debugging much easier.
#    Good:

    dart
    
    catch (e) {
    // do whatever you want to handle the exception
        rethrow;
    }
#    Not Good:

    dart
    
    catch (e) {
        // do whatever you want to handle the exception
        throw e;
    }
    Do not use Try-Catch for predictable logic: Use Try-Catch only for unpredictable external factors (Network calls, File I/O, parsing JSON). Do not use Try-Catch to check if a List is out of bounds or if a variable is null. explicitly check for errors programmatically (if (index < list.length)) rather than waiting for exceptions to occur.
    
    Global Error Handling: Utilize FlutterError.onError and PlatformDispatcher.instance.onError in your main.dart to catch unhandled exceptions globally and send them to a crash reporting service (like Firebase Crashlytics or Sentry) rather than wrapping every single method in a try-catch block.


