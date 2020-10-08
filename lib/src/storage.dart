part of ulog;

class Storage {
  int capacity = 1000;

  List<Message> _messages;

  void addMessage(Message message) {
    _messages.insert(0, message);
  }

  List<Message> getLast(int count, [LogLevel level]) {
    List<Message> messages = _messages;
    if (level != null) {
      messages = _messages.where((m) => m.logLevel == level).toList();
    }
    return messages
        .sublist(0, count > messages.length ? null : count)
        .reversed
        .toList();
  }

  Storage() {
    _messages = new List<Message>();
  }
}
