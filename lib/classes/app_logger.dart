
import 'package:logger/logger.dart';

class AppLogger {
  get prettyInfo {
    return pretty_i;
  }

  get noStack_i {
    return noStack.i;
  }

  void pretty_i(String message) {
    pretty.i(message);
  }

  void pretty_d(String message) {
    pretty.d(message);
  }

  void pretty_w(String message) {
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