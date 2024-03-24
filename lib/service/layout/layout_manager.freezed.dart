// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'layout_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LayoutData _$LayoutDataFromJson(Map<String, dynamic> json) {
  return _LayoutData.fromJson(json);
}

/// @nodoc
mixin _$LayoutData {
  @SizeJsonConverter()
  Size get size => throw _privateConstructorUsedError;
  @EdgeInsetsJsonConverter()
  EdgeInsets get padding => throw _privateConstructorUsedError;
  @EdgeInsetsJsonConverter()
  EdgeInsets get viewPadding => throw _privateConstructorUsedError;
  @EdgeInsetsJsonConverter()
  EdgeInsets get viewInsets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LayoutDataCopyWith<LayoutData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LayoutDataCopyWith<$Res> {
  factory $LayoutDataCopyWith(
          LayoutData value, $Res Function(LayoutData) then) =
      _$LayoutDataCopyWithImpl<$Res, LayoutData>;
  @useResult
  $Res call(
      {@SizeJsonConverter() Size size,
      @EdgeInsetsJsonConverter() EdgeInsets padding,
      @EdgeInsetsJsonConverter() EdgeInsets viewPadding,
      @EdgeInsetsJsonConverter() EdgeInsets viewInsets});
}

/// @nodoc
class _$LayoutDataCopyWithImpl<$Res, $Val extends LayoutData>
    implements $LayoutDataCopyWith<$Res> {
  _$LayoutDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? padding = null,
    Object? viewPadding = null,
    Object? viewInsets = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as EdgeInsets,
      viewPadding: null == viewPadding
          ? _value.viewPadding
          : viewPadding // ignore: cast_nullable_to_non_nullable
              as EdgeInsets,
      viewInsets: null == viewInsets
          ? _value.viewInsets
          : viewInsets // ignore: cast_nullable_to_non_nullable
              as EdgeInsets,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LayoutDataImplCopyWith<$Res>
    implements $LayoutDataCopyWith<$Res> {
  factory _$$LayoutDataImplCopyWith(
          _$LayoutDataImpl value, $Res Function(_$LayoutDataImpl) then) =
      __$$LayoutDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@SizeJsonConverter() Size size,
      @EdgeInsetsJsonConverter() EdgeInsets padding,
      @EdgeInsetsJsonConverter() EdgeInsets viewPadding,
      @EdgeInsetsJsonConverter() EdgeInsets viewInsets});
}

/// @nodoc
class __$$LayoutDataImplCopyWithImpl<$Res>
    extends _$LayoutDataCopyWithImpl<$Res, _$LayoutDataImpl>
    implements _$$LayoutDataImplCopyWith<$Res> {
  __$$LayoutDataImplCopyWithImpl(
      _$LayoutDataImpl _value, $Res Function(_$LayoutDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? padding = null,
    Object? viewPadding = null,
    Object? viewInsets = null,
  }) {
    return _then(_$LayoutDataImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as EdgeInsets,
      viewPadding: null == viewPadding
          ? _value.viewPadding
          : viewPadding // ignore: cast_nullable_to_non_nullable
              as EdgeInsets,
      viewInsets: null == viewInsets
          ? _value.viewInsets
          : viewInsets // ignore: cast_nullable_to_non_nullable
              as EdgeInsets,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LayoutDataImpl extends _LayoutData with DiagnosticableTreeMixin {
  const _$LayoutDataImpl(
      {@SizeJsonConverter() this.size = Size.zero,
      @EdgeInsetsJsonConverter() this.padding = EdgeInsets.zero,
      @EdgeInsetsJsonConverter() this.viewPadding = EdgeInsets.zero,
      @EdgeInsetsJsonConverter() this.viewInsets = EdgeInsets.zero})
      : super._();

  factory _$LayoutDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LayoutDataImplFromJson(json);

  @override
  @JsonKey()
  @SizeJsonConverter()
  final Size size;
  @override
  @JsonKey()
  @EdgeInsetsJsonConverter()
  final EdgeInsets padding;
  @override
  @JsonKey()
  @EdgeInsetsJsonConverter()
  final EdgeInsets viewPadding;
  @override
  @JsonKey()
  @EdgeInsetsJsonConverter()
  final EdgeInsets viewInsets;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LayoutData(size: $size, padding: $padding, viewPadding: $viewPadding, viewInsets: $viewInsets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LayoutData'))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('padding', padding))
      ..add(DiagnosticsProperty('viewPadding', viewPadding))
      ..add(DiagnosticsProperty('viewInsets', viewInsets));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LayoutDataImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.viewPadding, viewPadding) ||
                other.viewPadding == viewPadding) &&
            (identical(other.viewInsets, viewInsets) ||
                other.viewInsets == viewInsets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, size, padding, viewPadding, viewInsets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LayoutDataImplCopyWith<_$LayoutDataImpl> get copyWith =>
      __$$LayoutDataImplCopyWithImpl<_$LayoutDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LayoutDataImplToJson(
      this,
    );
  }
}

abstract class _LayoutData extends LayoutData {
  const factory _LayoutData(
          {@SizeJsonConverter() final Size size,
          @EdgeInsetsJsonConverter() final EdgeInsets padding,
          @EdgeInsetsJsonConverter() final EdgeInsets viewPadding,
          @EdgeInsetsJsonConverter() final EdgeInsets viewInsets}) =
      _$LayoutDataImpl;
  const _LayoutData._() : super._();

  factory _LayoutData.fromJson(Map<String, dynamic> json) =
      _$LayoutDataImpl.fromJson;

  @override
  @SizeJsonConverter()
  Size get size;
  @override
  @EdgeInsetsJsonConverter()
  EdgeInsets get padding;
  @override
  @EdgeInsetsJsonConverter()
  EdgeInsets get viewPadding;
  @override
  @EdgeInsetsJsonConverter()
  EdgeInsets get viewInsets;
  @override
  @JsonKey(ignore: true)
  _$$LayoutDataImplCopyWith<_$LayoutDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
