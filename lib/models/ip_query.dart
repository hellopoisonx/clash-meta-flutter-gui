import 'package:clash_meta_flutter/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part "ip_query.g.dart";

@JsonSerializable(explicitToJson: true)
class IpQuery extends ChangeNotifier {
  @JsonKey(name: 'rs')
  int rs = 0;
  @JsonKey(name: 'code')
  int code = 0;
  @JsonKey(name: 'address')
  String address = "";
  @JsonKey(name: 'ip')
  String ip = "";
  @JsonKey(name: 'isDomain')
  int isdomain = 0;
  IpQuery();
  void futureGenerate() async {
    final n = IpQuery.fromJson(await getIpInfo());
    rs = n.rs;
    code = n.code;
    address = n.address;
    ip = n.ip;
    isdomain = n.isdomain;
    notifyListeners();
  }

  factory IpQuery.fromJson(Map<String, dynamic> json) =>
      _$IpQueryFromJson(json);
  Map<String, dynamic> toJson() => _$IpQueryToJson(this);
}
