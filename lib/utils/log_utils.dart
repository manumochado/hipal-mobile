import 'package:logger/logger.dart';

class LogUtils {
  final logger = Logger(
      level: Level.debug,
      printer: PrettyPrinter(printEmojis: false, methodCount: 0));
  final _logger = Logger(level: Level.debug, printer: PrettyPrinter());

  void logObj(dynamic obj) => _logger.e(obj.toString());

  void logVerbose(String log) => logger.v(log);
  void logDebug(String log) => logger.d(log);
  void logInfo(String log) => logger.i(log);
  void logWarning(String log) => logger.w(log);
  void logError(String log) => logger.e(log);
}
