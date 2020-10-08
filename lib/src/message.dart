part of ulog;

class Message {
  LogLevel logLevel;
  String message;
  DateTime time;

  Message(this.logLevel, this.message, this.time);

  String get messageHeader {
    String messageHeader = "";
    messageHeader += prefixForLogLevel(logLevel);
    messageHeader += formatDate(time);
    messageHeader += message;
    return messageHeader;
  }

  String formatDate(DateTime time) {
    String result = time.day.toString();
    result += ".${time.month.toString()}";
    result += ".${time.year.toString()} ";
    result += "${time.hour}:${time.minute}:${time.millisecond} ";
    return result;
  }

  String prefixForLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.info:
        return "I: ";
      case LogLevel.warn:
        return "W: ";
      case LogLevel.error:
        return "E: ";
      case LogLevel.success:
        return "S: ";
    }
  }
}
