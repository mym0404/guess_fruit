import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'export.dart';
import 'feature/core/widget/app_scroll_behavior.dart';
import 'feature/home/ui/page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await bootStrap();
}

final safetySettings = [
  SafetySetting(
    category: SafetyCategory.dangerous,
    threshold: SafetyThreshold.blockNone,
  ),
  SafetySetting(
    category: SafetyCategory.harassment,
    threshold: SafetyThreshold.blockNone,
  ),
  SafetySetting(
    category: SafetyCategory.hateSpeech,
    threshold: SafetyThreshold.blockNone,
  ),
  SafetySetting(
    category: SafetyCategory.sexuallyExplicit,
    threshold: SafetyThreshold.blockNone,
  ),
];

Future<void> bootStrap() async {
  await dotenv.load(fileName: '.env');
  Gemini.init(
      apiKey: (dotenv.env['GEMINI_KEY'] ?? ''),
      enableDebugging: false,
      safetySettings: safetySettings);

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
