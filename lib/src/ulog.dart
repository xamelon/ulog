part of ulog;

class ULog {
  static final ULog u = ULog._();

  String df = "dd.MM.yyyy HH:mm:ss";
  bool colorOutputEnabled = true;
  ULog._();

  Map<String, Message> networkMessages = new Map<String, Message>();

  Storage _storage = Storage();

  String getLastMessages(int count, [LogLevel level]) {
    return _storage.getLast(count, level).fold(" ", (String prev, elem) {
      prev += "\n";
      prev += elem.messageHeader;
      return prev;
    });
  }

  void logWarn(String message) {
    Message logMessage = Message(LogLevel.warn, message, DateTime.now());
    _storage.addMessage(logMessage);
    print(logMessage.messageHeader);
  }

  void logError(String message, [Exception error]) {
    Message logMessage = Message(LogLevel.error, message, DateTime.now());
    _storage.addMessage(logMessage);
    print(logMessage.messageHeader);
  }

  void logSuccess(String message) {
    Message logMessage = Message(LogLevel.success, message, DateTime.now());
    _storage.addMessage(logMessage);
    print(logMessage.messageHeader);
  }

  void logInfo(String message) {
    Message logMessage = Message(LogLevel.info, message, DateTime.now());
    _storage.addMessage(logMessage);
    print(logMessage.messageHeader);
  }

  void logNetworkBegin(String endpoint, NetworkMethod method) {
    Message logMessage =
        NetworkMessage(LogLevel.info, DateTime.now(), method, endpoint);
    _storage.addMessage(logMessage);
    print(logMessage.messageHeader);
  }

  void logNetworkEnd(String endpoint, NetworkMethod method) {
    Message logMessage =
        NetworkMessage(LogLevel.info, DateTime.now(), method, endpoint);
    _storage.addMessage(logMessage);
    print(logMessage.messageHeader);
  }
}
