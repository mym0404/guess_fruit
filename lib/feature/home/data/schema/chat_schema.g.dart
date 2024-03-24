// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSchemaImpl _$$ChatSchemaImplFromJson(Map<String, dynamic> json) =>
    _$ChatSchemaImpl(
      created: DateTime.parse(json['created'] as String),
      content: json['content'] as String,
      isFromUser: json['isFromUser'] as bool,
      isError: json['isError'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatSchemaImplToJson(_$ChatSchemaImpl instance) =>
    <String, dynamic>{
      'created': instance.created.toIso8601String(),
      'content': instance.content,
      'isFromUser': instance.isFromUser,
      'isError': instance.isError,
    };
