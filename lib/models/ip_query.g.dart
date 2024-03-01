// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ip_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IpQuery _$IpQueryFromJson(Map<String, dynamic> json) => IpQuery()
  ..rs = json['rs'] as int
  ..code = json['code'] as int
  ..address = json['address'] as String
  ..ip = json['ip'] as String
  ..isdomain = json['isDomain'] as int;

Map<String, dynamic> _$IpQueryToJson(IpQuery instance) => <String, dynamic>{
      'rs': instance.rs,
      'code': instance.code,
      'address': instance.address,
      'ip': instance.ip,
      'isDomain': instance.isdomain,
    };
