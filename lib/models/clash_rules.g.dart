// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clash_rules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClashRules _$ClashRulesFromJson(Map<String, dynamic> json) => ClashRules()
  ..rules = (json['rules'] as List<dynamic>)
      .map((e) => ClashRuleItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ClashRulesToJson(ClashRules instance) =>
    <String, dynamic>{
      'rules': instance.rules.map((e) => e.toJson()).toList(),
    };

ClashRuleItem _$ClashRuleItemFromJson(Map<String, dynamic> json) =>
    ClashRuleItem(
      type: json['type'] as String,
      payload: json['payload'] as String,
      proxy: json['proxy'] as String,
      size: json['size'] as int,
    );

Map<String, dynamic> _$ClashRuleItemToJson(ClashRuleItem instance) =>
    <String, dynamic>{
      'type': instance.type,
      'payload': instance.payload,
      'proxy': instance.proxy,
      'size': instance.size,
    };
