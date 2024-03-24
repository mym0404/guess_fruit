import 'package:local_file_preferences/local_file_preferences.dart';

import '../../../export.dart';

enum L10NManagerValue {
  enUS(Locale('en', 'US')),
  ko(Locale('ko')),
  ;

  final Locale locale;
  const L10NManagerValue(this.locale);
}

class L10NManager with LocalFilePrefMixin<L10NManagerValue> {
  L10NManager() {
    S.load(load().locale);
  }

  @override
  L10NManagerValue get fallback => Intl.getCurrentLocale().startsWith('en')
      ? L10NManagerValue.enUS
      : L10NManagerValue.ko;

  @override
  String get fileName => 'L10N_settings.dat';

  @override
  Json toJson() => {'locale': value.name};

  @override
  L10NManagerValue fromJson(Json json) =>
      L10NManagerValue.values
          .firstWhereOrNull((element) => element.name == json['locale']) ??
      L10NManagerValue.enUS;

  Future<void> changeLocale(L10NManagerValue value) async {
    await S.load(value.locale);
    this.value = value;
  }

  Locale get locale => value.locale;
}
