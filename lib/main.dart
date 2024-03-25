import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'export.dart';
import 'feature/core/util/gemini.dart';
import 'feature/core/widget/app_scroll_behavior.dart';
import 'feature/home/ui/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootStrap();
}

Future<void> bootStrap() async {
  await dotenv.load(fileName: '.env');
  initGemini();

  await registerSingletons();
  _registerErrorHandler();
  runApp(const BootStrapApp());
}

void _registerErrorHandler() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    log.e('flutter Error Occurred',
        error: details.exception, stackTrace: details.stack);
  };
  PlatformDispatcher.instance.onError = (exception, stackTrace) {
    log.e('Platform Error Occurred', error: exception, stackTrace: stackTrace);
    return true;
  };
}

class BootStrapApp extends StatelessWidget with WatchItMixin {
  const BootStrapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: AppTheme.instance.createTheme(Brightness.light),
      darkTheme: AppTheme.instance.createTheme(Brightness.dark),
      themeMode: ThemeMode.dark,
      scrollBehavior: const AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
    );
  }
}
