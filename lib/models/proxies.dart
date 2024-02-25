import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proxies.g.dart';

class Delays extends ChangeNotifier {
  Map<String, int> delays = {};
  void updateDelays(Map<String, int> value) {
    delays.addAll(value);
    notifyListeners();
  }
}

@JsonSerializable()
class Proxies {
  @JsonKey(name: "proxies")
  Map<String, ProxyItem> proxyList = {};

  Proxies();
  factory Proxies.fromJson(Map<String, dynamic> json) =>
      _$ProxiesFromJson(json);

  Map<String, dynamic> toJson() => _$ProxiesToJson(this);
}

@JsonSerializable()
class ProxyItem {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "udp")
  final bool udp;
  @JsonKey(name: "xudp")
  final bool xudp;
  @JsonKey(name: "tfo")
  final bool tfo;
  @JsonKey(name: "history")
  final List<History>? history;
  @JsonKey(name: "all")
  final List<String>? all;
  @JsonKey(name: "now")
  final String? now;
  @JsonKey(name: "hidden")
  final bool? hidden;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "provider")
  final String? provider;

  ProxyItem({
    required this.name,
    required this.type,
    required this.udp,
    required this.xudp,
    required this.tfo,
    this.history,
    this.all,
    this.now,
    this.hidden,
    this.icon,
    this.provider,
  });

  ProxyItem copyWith({
    String? name,
    String? type,
    bool? udp,
    bool? xudp,
    bool? tfo,
    List<History>? history,
    List<String>? all,
    String? now,
    bool? hidden,
    String? icon,
    String? provider,
  }) =>
      ProxyItem(
        name: name ?? this.name,
        type: type ?? this.type,
        udp: udp ?? this.udp,
        xudp: xudp ?? this.xudp,
        tfo: tfo ?? this.tfo,
        history: history ?? this.history,
        all: all ?? this.all,
        now: now ?? this.now,
        hidden: hidden ?? this.hidden,
        icon: icon ?? this.icon,
        provider: provider ?? this.provider,
      );

  factory ProxyItem.fromJson(Map<String, dynamic> json) =>
      _$ProxyItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProxyItemToJson(this);
}

@JsonSerializable()
class History {
  @JsonKey(name: "time")
  final String? time;
  @JsonKey(name: "delay")
  final int? delay;

  History({
    this.time,
    this.delay,
  });

  History copyWith({
    String? time,
    int? delay,
  }) =>
      History(
        time: time ?? this.time,
        delay: delay ?? this.delay,
      );

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}