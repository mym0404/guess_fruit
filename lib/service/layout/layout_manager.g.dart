// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_manager.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LayoutDataImpl _$$LayoutDataImplFromJson(Map<String, dynamic> json) =>
    _$LayoutDataImpl(
      size: json['size'] == null
          ? Size.zero
          : const SizeJsonConverter().fromJson(json['size'] as String),
      padding: json['padding'] == null
          ? EdgeInsets.zero
          : const EdgeInsetsJsonConverter().fromJson(json['padding'] as String),
      viewPadding: json['viewPadding'] == null
          ? EdgeInsets.zero
          : const EdgeInsetsJsonConverter()
              .fromJson(json['viewPadding'] as String),
      viewInsets: json['viewInsets'] == null
          ? EdgeInsets.zero
          : const EdgeInsetsJsonConverter()
              .fromJson(json['viewInsets'] as String),
    );

Map<String, dynamic> _$$LayoutDataImplToJson(_$LayoutDataImpl instance) =>
    <String, dynamic>{
      'size': const SizeJsonConverter().toJson(instance.size),
      'padding': const EdgeInsetsJsonConverter().toJson(instance.padding),
      'viewPadding':
          const EdgeInsetsJsonConverter().toJson(instance.viewPadding),
      'viewInsets': const EdgeInsetsJsonConverter().toJson(instance.viewInsets),
    };
