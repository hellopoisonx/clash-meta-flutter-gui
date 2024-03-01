import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "clash_rules.g.dart";

@JsonSerializable(explicitToJson: true)
class ClashRules extends ChangeNotifier {
  @JsonKey(name: 'rules')
  List<ClashRuleItem> rules = [];
  int get rulesAmount => rules.length;
  ClashRules();
  void futureGenerate() async {
    rules = ClashRules.fromJson(await getRules()).rules;
    notifyListeners();
  }

  factory ClashRules.fromJson(Map<String, dynamic> json) =>
      _$ClashRulesFromJson(json);
  Map<String, dynamic> toJson() => _$ClashRulesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClashRuleItem {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'payload')
  final String payload;
  @JsonKey(name: 'proxy')
  final String proxy;
  @JsonKey(name: 'size')
  final int size;
  ClashRuleItem(
      {required this.type,
      required this.payload,
      required this.proxy,
      required this.size});
  factory ClashRuleItem.fromJson(Map<String, dynamic> json) =>
      _$ClashRuleItemFromJson(json);
  Map<String, dynamic> toJson() => _$ClashRuleItemToJson(this);
}
