// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_schema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatSchema _$ChatSchemaFromJson(Map<String, dynamic> json) {
  return _ChatSchema.fromJson(json);
}

/// @nodoc
mixin _$ChatSchema {
  DateTime get created => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  bool get isFromUser => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSchemaCopyWith<ChatSchema> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSchemaCopyWith<$Res> {
  factory $ChatSchemaCopyWith(
          ChatSchema value, $Res Function(ChatSchema) then) =
      _$ChatSchemaCopyWithImpl<$Res, ChatSchema>;
  @useResult
  $Res call({DateTime created, String content, bool isFromUser, bool isError});
}

/// @nodoc
class _$ChatSchemaCopyWithImpl<$Res, $Val extends ChatSchema>
    implements $ChatSchemaCopyWith<$Res> {
  _$ChatSchemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? content = null,
    Object? isFromUser = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isFromUser: null == isFromUser
          ? _value.isFromUser
          : isFromUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatSchemaImplCopyWith<$Res>
    implements $ChatSchemaCopyWith<$Res> {
  factory _$$ChatSchemaImplCopyWith(
          _$ChatSchemaImpl value, $Res Function(_$ChatSchemaImpl) then) =
      __$$ChatSchemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime created, String content, bool isFromUser, bool isError});
}

/// @nodoc
class __$$ChatSchemaImplCopyWithImpl<$Res>
    extends _$ChatSchemaCopyWithImpl<$Res, _$ChatSchemaImpl>
    implements _$$ChatSchemaImplCopyWith<$Res> {
  __$$ChatSchemaImplCopyWithImpl(
      _$ChatSchemaImpl _value, $Res Function(_$ChatSchemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? content = null,
    Object? isFromUser = null,
    Object? isError = null,
  }) {
    return _then(_$ChatSchemaImpl(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      isFromUser: null == isFromUser
          ? _value.isFromUser
          : isFromUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSchemaImpl extends _ChatSchema with DiagnosticableTreeMixin {
  const _$ChatSchemaImpl(
      {required this.created,
      required this.content,
      required this.isFromUser,
      this.isError = false})
      : super._();

  factory _$ChatSchemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSchemaImplFromJson(json);

  @override
  final DateTime created;
  @override
  final String content;
  @override
  final bool isFromUser;
  @override
  @JsonKey()
  final bool isError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatSchema(created: $created, content: $content, isFromUser: $isFromUser, isError: $isError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatSchema'))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('isFromUser', isFromUser))
      ..add(DiagnosticsProperty('isError', isError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSchemaImpl &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.isFromUser, isFromUser) ||
                other.isFromUser == isFromUser) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, created, content, isFromUser, isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSchemaImplCopyWith<_$ChatSchemaImpl> get copyWith =>
      __$$ChatSchemaImplCopyWithImpl<_$ChatSchemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSchemaImplToJson(
      this,
    );
  }
}

abstract class _ChatSchema extends ChatSchema {
  const factory _ChatSchema(
      {required final DateTime created,
      required final String content,
      required final bool isFromUser,
      final bool isError}) = _$ChatSchemaImpl;
  const _ChatSchema._() : super._();

  factory _ChatSchema.fromJson(Map<String, dynamic> json) =
      _$ChatSchemaImpl.fromJson;

  @override
  DateTime get created;
  @override
  String get content;
  @override
  bool get isFromUser;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$ChatSchemaImplCopyWith<_$ChatSchemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
