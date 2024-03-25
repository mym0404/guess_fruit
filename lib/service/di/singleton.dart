import 'package:logger/logger.dart';

import '../../export.dart';
import '../../feature/core/util/local_storage.dart';
import '../layout/layout_manager.dart';

Future<void> registerSingletons() async {
  var sp = await SharedPreferences.getInstance();
  di.registerSingleton(LocalStorage(sp));
  di.registerSingleton(
    Logger(
      printer: PrettyPrinter(
        colors: true,
        lineLength: 40,
        printEmojis: false,
        printTime: false,
        methodCount: 1,
        errorMethodCount: 5,
      ),
    ),
  );
  di.registerSingleton(LayoutManager());
}

Logger get log => di();
