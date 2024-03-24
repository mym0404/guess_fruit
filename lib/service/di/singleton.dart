import 'package:logger/logger.dart';

import '../../export.dart';
import '../../feature/core/util/local_storage.dart';
import '../layout/layout_manager.dart';

Future<void> registerSingletons() async {
  var sp = await SharedPreferences.getInstance();
  di.registerSingleton(LocalStorage(sp));
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
