
import 'package:logger/logger.dart';

class AppLogger {
  get prettyInfo {
    return prettyInfoMsg;
  }

  get noStackInfo {
    return noStack.i;
  }

  void prettyInfoMsg(String message) {
    pretty.i(message);
  }

  void prettyDebugMsg(String message) {
    pretty.d(message);
  }

  void prettyWarningMsg(String message) {
    pretty.w(message);
  }

  var pretty = Logger(
    printer: PrettyPrinter(
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  var noStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );
}