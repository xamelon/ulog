import 'package:flutter_test/flutter_test.dart';

import 'package:ulog/ulog.dart';

void main() {
  test("log warn with yellow cloor", () {
    ULog.u.logWarn("Some yellow message");
  });

  test("log error with red color", () {
    ULog.u.logError("Some red message");
  });

  test("log success with green color", () {
    ULog.u.logSuccess("Success");
  });

  test("log info with green color", () {
    ULog.u.logInfo("-> GET /api/patient");
  });

  test("log network info", () {
    ULog.u.logNetworkBegin("ShoppingCart", NetworkMethod.get);
  });

  test("get last 5 messages", () {
    String messages = ULog.u.getLastMessages(5);
    print(messages);
  });
}
