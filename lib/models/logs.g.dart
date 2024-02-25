// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogItem _$LogItemFromJson(Map<String, dynamic> json) => LogItem(
      type: json['type'] as String,
      payload: json['payload'] as String,
    );

Map<String, dynamic> _$LogItemToJson(LogItem instance) => <String, dynamic>{
      'type': instance.type,
      'payload': instance.payload,
    };
