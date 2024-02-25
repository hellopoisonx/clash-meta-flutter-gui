// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clash_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClashConfig _$ClashConfigFromJson(Map<String, dynamic> json) => ClashConfig(
      port: json['port'] as int,
      socksPort: json['socks-port'] as int,
      redirPort: json['redir-port'] as int,
      tproxyPort: json['tproxy-port'] as int,
      mixedPort: json['mixed-port'] as int,
      tun: Tun.fromJson(json['tun'] as Map<String, dynamic>),
      tuicServer:
          TuicServer.fromJson(json['tuic-server'] as Map<String, dynamic>),
      ssConfig: json['ss-config'] as String,
      vmessConfig: json['vmess-config'] as String,
      authentication: json['authentication'],
      skipAuthPrefixes: json['skip-auth-prefixes'],
      lanAllowedIps: (json['lan-allowed-ips'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lanDisallowedIps: json['lan-disallowed-ips'],
      allowLan: json['allow-lan'] as bool,
      bindAddress: json['bind-address'] as String,
      inboundTfo: json['inbound-tfo'] as bool,
      inboundMptcp: json['inbound-mptcp'] as bool,
      mode: json['mode'] as String,
      unifiedDelay: json['UnifiedDelay'] as bool,
      logLevel: json['log-level'] as String,
      ipv6: json['ipv6'] as bool,
      interfaceName: json['interface-name'] as String,
      geoxUrl: GeoxUrl.fromJson(json['geox-url'] as Map<String, dynamic>),
      geoAutoUpdate: json['geo-auto-update'] as bool,
      geoUpdateInterval: json['geo-update-interval'] as int,
      geodataMode: json['geodata-mode'] as bool,
      geodataLoader: json['geodata-loader'] as String,
      geositeMatcher: json['geosite-matcher'] as String,
      tcpConcurrent: json['tcp-concurrent'] as bool,
      findProcessMode: json['find-process-mode'] as String,
      sniffing: json['sniffing'] as bool,
      globalClientFingerprint: json['global-client-fingerprint'] as String,
      globalUa: json['global-ua'] as String,
    );

Map<String, dynamic> _$ClashConfigToJson(ClashConfig instance) =>
    <String, dynamic>{
      'port': instance.port,
      'socks-port': instance.socksPort,
      'redir-port': instance.redirPort,
      'tproxy-port': instance.tproxyPort,
      'mixed-port': instance.mixedPort,
      'tun': instance.tun,
      'tuic-server': instance.tuicServer,
      'ss-config': instance.ssConfig,
      'vmess-config': instance.vmessConfig,
      'authentication': instance.authentication,
      'skip-auth-prefixes': instance.skipAuthPrefixes,
      'lan-allowed-ips': instance.lanAllowedIps,
      'lan-disallowed-ips': instance.lanDisallowedIps,
      'allow-lan': instance.allowLan,
      'bind-address': instance.bindAddress,
      'inbound-tfo': instance.inboundTfo,
      'inbound-mptcp': instance.inboundMptcp,
      'mode': instance.mode,
      'UnifiedDelay': instance.unifiedDelay,
      'log-level': instance.logLevel,
      'ipv6': instance.ipv6,
      'interface-name': instance.interfaceName,
      'geox-url': instance.geoxUrl,
      'geo-auto-update': instance.geoAutoUpdate,
      'geo-update-interval': instance.geoUpdateInterval,
      'geodata-mode': instance.geodataMode,
      'geodata-loader': instance.geodataLoader,
      'geosite-matcher': instance.geositeMatcher,
      'tcp-concurrent': instance.tcpConcurrent,
      'find-process-mode': instance.findProcessMode,
      'sniffing': instance.sniffing,
      'global-client-fingerprint': instance.globalClientFingerprint,
      'global-ua': instance.globalUa,
    };

GeoxUrl _$GeoxUrlFromJson(Map<String, dynamic> json) => GeoxUrl(
      geoip: json['geoip'] as String,
      mmdb: json['mmdb'] as String,
      geosite: json['geosite'] as String,
    );

Map<String, dynamic> _$GeoxUrlToJson(GeoxUrl instance) => <String, dynamic>{
      'geoip': instance.geoip,
      'mmdb': instance.mmdb,
      'geosite': instance.geosite,
    };

TuicServer _$TuicServerFromJson(Map<String, dynamic> json) => TuicServer(
      enable: json['enable'] as bool,
      listen: json['listen'] as String,
      certificate: json['certificate'] as String,
      privateKey: json['private-key'] as String,
      muxOption: MuxOption.fromJson(json['mux-option'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TuicServerToJson(TuicServer instance) =>
    <String, dynamic>{
      'enable': instance.enable,
      'listen': instance.listen,
      'certificate': instance.certificate,
      'private-key': instance.privateKey,
      'mux-option': instance.muxOption,
    };

MuxOption _$MuxOptionFromJson(Map<String, dynamic> json) => MuxOption(
      brutal: Brutal.fromJson(json['brutal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MuxOptionToJson(MuxOption instance) => <String, dynamic>{
      'brutal': instance.brutal,
    };

Brutal _$BrutalFromJson(Map<String, dynamic> json) => Brutal(
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$BrutalToJson(Brutal instance) => <String, dynamic>{
      'enabled': instance.enabled,
    };

Tun _$TunFromJson(Map<String, dynamic> json) => Tun(
      enable: json['enable'] as bool,
      device: json['device'] as String,
      stack: json['stack'] as String,
      dnsHijack: (json['dns-hijack'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      autoRoute: json['auto-route'] as bool,
      autoDetectInterface: json['auto-detect-interface'] as bool,
      inet4Address: (json['inet4-address'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      fileDescriptor: json['file-descriptor'] as int,
    );

Map<String, dynamic> _$TunToJson(Tun instance) => <String, dynamic>{
      'enable': instance.enable,
      'device': instance.device,
      'stack': instance.stack,
      'dns-hijack': instance.dnsHijack,
      'auto-route': instance.autoRoute,
      'auto-detect-interface': instance.autoDetectInterface,
      'inet4-address': instance.inet4Address,
      'file-descriptor': instance.fileDescriptor,
    };
