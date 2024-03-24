import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../design/color/color_manager.dart';
import '../../export.dart';
import '../../feature/common/widget/app_scroll_behavior.dart';
import '../l10n/util/l10n_manager.dart';
import '../router/app_router.dart';

Future<void> bootStrap() async {
  await registerSingletons();
  _registerErrorHandler();
  runApp(const ProviderScope(child: BootStrapApp()));
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
    var isDarkMode =
        watchPropertyValue((ColorManager settings) => settings.isDarkMode);
    var locale = watchPropertyValue((L10NManager settings) => settings.locale);

    return MaterialApp.router(
      routerConfig: appRouter,
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.instance.createTheme(Brightness.light),
      darkTheme: AppTheme.instance.createTheme(Brightness.dark),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      scrollBehavior: const AppScrollBehavior(),
    );
  }
}
