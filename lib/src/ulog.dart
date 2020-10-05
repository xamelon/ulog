part of ulog;

class ULog {
  static final ULog u = ULog._();

  String df = "dd.MM.yyyy HH:mm:ss";
  bool colorOutputEnabled = true;
  ULog._();

  void logWarn(String message) {
    Message logMessage = Message(LogLevel.warn, message, DateTime.now());
    _printMessageHeader(logMessage);
  }

  void logError(String message, [dynamic error]) {
    Message logMessage = Message(LogLevel.error, message, DateTime.now());
    _printMessageHeader(logMessage);
  }

  void logSuccess(String message) {
    Message logMessage = Message(LogLevel.success, message, DateTime.now());
    _printMessageHeader(logMessage);
  }

  void logInfo(String message) {
    Message logMessage = Message(LogLevel.info, message, DateTime.now());
    _printMessageHeader(logMessage);
  }

  void _printMessageHeader(Message logMessage) {
    String message = "";
    if (colorOutputEnabled) message += colorForLogLevel(logMessage.logLevel);
    message += formatDate(logMessage.time);
    message += logMessage.message;
    print(message);
    print(Colors.reset);
  }

  String formatDate(DateTime time) {
    String result = time.day.toString();
    result += ".${time.month.toString()}";
    result += ".${time.year.toString()} ";
    result += "${time.hour}:${time.minute}:${time.millisecond} ";
    return result;
  }

  String colorForLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.info:
        return Colors.reset;
      case LogLevel.warn:
        return Colors.yellow;
      case LogLevel.error:
        return Colors.red;
      case LogLevel.success:
        return Colors.green;
    }
  }
}
