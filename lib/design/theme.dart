import '../export.dart';
import 'color/color_manager.dart';

class AppTheme {
  static final AppTheme instance = AppTheme._internal();
  AppTheme._internal();

  final _textTheme = const TextTheme(
    displayLarge: TS.displayLarge,
    displayMedium: TS.displayMedium,
    displaySmall: TS.displaySmall,
    headlineLarge: TS.headLarge,
    headlineMedium: TS.headMedium,
    headlineSmall: TS.headLarge,
    titleLarge: TS.titleLarge,
    titleMedium: TS.titleMedium,
    titleSmall: TS.titleSmall,
    labelLarge: TS.labelLarge,
    labelMedium: TS.labelMedium,
    labelSmall: TS.labelSmall,
    bodyLarge: TS.bodyLarge,
    bodyMedium: TS.bodyMedium,
    bodySmall: TS.bodySmall,
  );

  ThemeData createTheme(Brightness brightness) {
    ColorScheme colorScheme =
        di<ColorManager>().getColorSchemeByBrightness(brightness);

    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      textTheme: _textTheme,
    );
  }
}

extension BuildContextThemeExtension on BuildContext {
  ColorScheme get c => Theme.of(this).colorScheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  TextTheme get text => Theme.of(this).textTheme;
}

extension ColorSchemeExtension on ColorScheme {
  Color get surface30 => surface.withOpacity(0.3);
  Color get surface50 => surface.withOpacity(0.5);
  Color get surface70 => surface.withOpacity(0.7);
  Color get onSurface30 => onSurface.withOpacity(0.3);
  Color get onSurface50 => onSurface.withOpacity(0.5);
  Color get onSurface70 => onSurface.withOpacity(0.7);
  Color get primary30 => primary.withOpacity(0.3);
  Color get primary50 => primary.withOpacity(0.5);
  Color get primary70 => primary.withOpacity(0.7);
  // Color get surfaceGray =>
  //     brightness == Brightness.light ? const Color(0xFFE5E7EB) : const Color(0xFF3A3A3A);
  // Add mores!
}
