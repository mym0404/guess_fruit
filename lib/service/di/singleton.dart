import 'package:logger/logger.dart';

import '../../export.dart';
import '../layout/layout_manager.dart';

Future<void> registerSingletons() async {
  di.registerSingleton(
    Logger(
      printer: PrefixPrinter(
        PrettyPrinter(
          colors: false,
        ),
        error: '⛔',
        info: '💡',
        debug: '🌙',
      ),
    ),
  );
  di.registerSingleton(LayoutManager());
}

Logger get log => di();
