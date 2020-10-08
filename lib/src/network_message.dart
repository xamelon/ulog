part of ulog;

enum NetworkMethod { get, post, put, delete }

class NetworkMessage extends Message {
  String endpoint;
  NetworkMethod method;
  Map<String, dynamic> headers;
  dynamic body;

  NetworkMessage(LogLevel logLevel, DateTime time, this.method, this.endpoint,
      [this.headers, this.body])
      : super(logLevel, null, time) {
    this.message = "-> $methodName $endpoint";
  }

  String get methodName {
    return "$method".split(".").last.toUpperCase();
  }

  String get messageHeader {
    String messageHeader = "";
    messageHeader += prefixForLogLevel(logLevel);
    messageHeader += formatDate(this.time);
    messageHeader += message;
    return messageHeader;
  }
}
