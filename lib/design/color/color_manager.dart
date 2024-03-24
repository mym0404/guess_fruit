import 'package:local_file_preferences/local_file_preferences.dart';

import '../../export.dart';

part 'color_manager.freezed.dart';
part 'color_manager.g.dart';
part 'theme_colors.dart';

@freezed
class ColorManagerData with _$ColorManagerData {
  const ColorManagerData._();
  const factory ColorManagerData({
    @Default(true) bool isDarkMode,
  }) = _ColorManagerData;

  factory ColorManagerData.fromJson(Map<String, dynamic> json) =>
      _$ColorManagerDataFromJson(json);
}

class ColorManager with LocalFilePrefMixin<ColorManagerData> {
  @override
  ColorManagerData get fallback => const ColorManagerData();

  @override
  String get fileName => 'color_settings.dat';

  @override
  Map<String, dynamic> toJson() => value.toJson();
  @override
  ColorManagerData fromJson(Json json) => ColorManagerData.fromJson(json);

  bool get isDarkMode => value.isDarkMode;
  ColorScheme get colorScheme =>
      isDarkMode ? _appColorSchemeDark : _appColorSchemeLight;

  ColorScheme getColorSchemeByBrightness(Brightness brightness) =>
      brightness == Brightness.light
          ? _appColorSchemeLight
          : _appColorSchemeDark;

  void setDarkMode(bool isDarkMode) =>
      value = value.copyWith(isDarkMode: isDarkMode);
  void toggleDarkMode() => value = value.copyWith(isDarkMode: !isDarkMode);
}
