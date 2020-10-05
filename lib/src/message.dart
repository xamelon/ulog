part of ulog;

class Message {
  LogLevel logLevel;
  String message;
  DateTime time;

  Message(this.logLevel, this.message, this.time);
}
