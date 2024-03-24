import 'package:local_file_preferences/local_file_preferences.dart';
import 'package:logger/logger.dart';

import '../../export.dart';
import '../layout/layout_manager.dart';

Future<void> registerSingletons() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  registerGlobalStorage(
      SharedPreferencesStorage(sharedPreferences: sharedPreferences));
  di.registerSingleton<LocalStorage>(
      SharedPreferencesLocalStorage(sharedPreferences));
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
