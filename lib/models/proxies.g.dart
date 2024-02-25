// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proxies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proxies _$ProxiesFromJson(Map<String, dynamic> json) => Proxies()
  ..proxyList = (json['proxies'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, ProxyItem.fromJson(e as Map<String, dynamic>)),
  );

Map<String, dynamic> _$ProxiesToJson(Proxies instance) => <String, dynamic>{
      'proxies': instance.proxyList,
    };

ProxyItem _$ProxyItemFromJson(Map<String, dynamic> json) => ProxyItem(
      name: json['name'] as String,
      type: json['type'] as String,
      udp: json['udp'] as bool,
      xudp: json['xudp'] as bool,
      tfo: json['tfo'] as bool,
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => History.fromJson(e as Map<String, dynamic>))
          .toList(),
      all: (json['all'] as List<dynamic>?)?.map((e) => e as String).toList(),
      now: json['now'] as String?,
      hidden: json['hidden'] as bool?,
      icon: json['icon'] as String?,
      provider: json['provider'] as String?,
    );

Map<String, dynamic> _$ProxyItemToJson(ProxyItem instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'udp': instance.udp,
      'xudp': instance.xudp,
      'tfo': instance.tfo,
      'history': instance.history,
      'all': instance.all,
      'now': instance.now,
      'hidden': instance.hidden,
      'icon': instance.icon,
      'provider': instance.provider,
    };

History _$HistoryFromJson(Map<String, dynamic> json) => History(
      time: json['time'] as String?,
      delay: json['delay'] as int?,
    );

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'time': instance.time,
      'delay': instance.delay,
    };
