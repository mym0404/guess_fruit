import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

final _kIsAndroid = Platform.isAndroid;
final _kIsIOS = Platform.isIOS;
final _kIsMobile = kIsWeb ? false : (_kIsAndroid || _kIsIOS);

abstract interface class Is {
  static bool get web => kIsWeb;
  static bool get mobile => _kIsMobile;
  static bool get android => _kIsAndroid;
  static bool get ios => _kIsIOS;
}
