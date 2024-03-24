export 'dart:async';
export 'dart:convert';
export 'dart:math' hide log;

export 'package:collection/collection.dart';
export 'package:flutter/foundation.dart' hide binarySearch, mergeSort;
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:gap/gap.dart';
export 'package:get_it/get_it.dart';
export 'package:go_router/go_router.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
export 'package:padding_extra/padding_extra.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:watch_it/watch_it.dart';

export 'assets/assets.gen.dart';
export 'design/theme.dart';
export 'design/typography/text_style.dart';
export 'feature/common/ui/widget/app_scaffold.dart';
export 'feature/common/util/is.dart';
export 'feature/common/util/lifecycle_util.dart';
export 'feature/common/util/local_storage.dart';
export 'feature/common/util/snack_bar_extension.dart';
export 'feature/common/util/style_extension.dart';
export 'service/di/singleton.dart';
export 'service/l10n/generated/l10n.dart';
export 'service/l10n/util/l10n_util.dart';
export 'service/router/route_extension.dart';

typedef VC = void Function();
typedef Json = Map<String, dynamic>;
