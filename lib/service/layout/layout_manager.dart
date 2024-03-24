import 'dart:ui';

import '../../export.dart';
import '../../feature/core/util/edge_insets_json_converter.dart';
import '../../feature/core/util/size_json_converter.dart';

part 'layout_manager.freezed.dart';
part 'layout_manager.g.dart';

@freezed
class LayoutData with _$LayoutData {
  const LayoutData._();
  const factory LayoutData({
    @Default(Size.zero) @SizeJsonConverter() Size size,
    @Default(EdgeInsets.zero) @EdgeInsetsJsonConverter() EdgeInsets padding,
    @Default(EdgeInsets.zero) @EdgeInsetsJsonConverter() EdgeInsets viewPadding,
    @Default(EdgeInsets.zero) @EdgeInsetsJsonConverter() EdgeInsets viewInsets,
  }) = _LayoutData;

  factory LayoutData.fromJson(Map<String, dynamic> json) =>
      _$LayoutDataFromJson(json);
}

class LayoutManager extends ValueNotifier<LayoutData> {
  LayoutManager([super.value = const LayoutData()]);

  Size get size => value.size;
  EdgeInsets get viewPadding => value.viewPadding;
  EdgeInsets get viewInsets => value.viewInsets;
  Display get display => PlatformDispatcher.instance.displays.first;

  /// Indicates which orientations the app will allow be default. Affects Android/iOS devices only.
  /// Defaults to both landscape (hz) and portrait (vt)
  List<Axis> supportedOrientations = [Axis.vertical, Axis.horizontal];

  /// Allow a view to override the currently supported orientations. For example, [FullscreenVideoViewer] always wants to enable both landscape and portrait.
  /// If a view sets this override, they are responsible for setting it back to null when finished.
  List<Axis>? _supportedOrientationsOverride;
  set supportedOrientationsOverride(List<Axis>? value) {
    if (_supportedOrientationsOverride != value) {
      _supportedOrientationsOverride = value;
      _updateSystemOrientation();
    }
  }

  void onSizeChanged({
    required Size size,
    required EdgeInsets padding,
    required EdgeInsets viewPadding,
    required EdgeInsets viewInsets,
  }) {
    /// Disable landscape layout on smaller form factors
    bool isSmall = display.size.shortestSide / display.devicePixelRatio < 600;
    supportedOrientations =
        isSmall ? [Axis.vertical] : [Axis.vertical, Axis.horizontal];
    _updateSystemOrientation();
    value = value.copyWith(
      size: size,
      padding: padding,
      viewPadding: viewPadding,
      viewInsets: viewInsets,
    );
  }

  /// Enable landscape, portrait or both. Views can call this method to override the default settings.
  /// For example, the [FullscreenVideoViewer] always wants to enable both landscape and portrait.
  /// If a view overrides this, it is responsible for setting it back to [supportedOrientations] when disposed.
  void _updateSystemOrientation() {
    final axisList = _supportedOrientationsOverride ?? supportedOrientations;
    //debugPrint('updateDeviceOrientation, supportedAxis: $axisList');
    final orientations = <DeviceOrientation>[];
    if (axisList.contains(Axis.vertical)) {
      orientations.addAll([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    if (axisList.contains(Axis.horizontal)) {
      orientations.addAll([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    SystemChrome.setPreferredOrientations(orientations);
  }
}
