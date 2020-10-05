part of ulog;

class Storage {
  static final Storage s = Storage._();

  int capacity = 1000;

  List<Message> _messages = new List<Message>(capacity);

  void addMessage(Message message) {
    _messages.insert(0, message);
  }

  List<Message> getLast(int count, [LogLevel level]) {
    List<Message> messages = _messages;
    if (filterLevel != null) {
      messages = _messages.where((m) => m.logLevel == level).toList();
    }
    return messages.sublist(0, count > messages.length ? null : count);
  }

  Storage._();
}
