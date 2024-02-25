import 'package:json_annotation/json_annotation.dart';

part 'clash_config.g.dart';

@JsonSerializable()
class ClashConfig {
  @JsonKey(name: "port")
  final int port;
  @JsonKey(name: "socks-port")
  final int socksPort;
  @JsonKey(name: "redir-port")
  final int redirPort;
  @JsonKey(name: "tproxy-port")
  final int tproxyPort;
  @JsonKey(name: "mixed-port")
  final int mixedPort;
  @JsonKey(name: "tun")
  final Tun tun;
  @JsonKey(name: "tuic-server")
  final TuicServer tuicServer;
  @JsonKey(name: "ss-config")
  final String ssConfig;
  @JsonKey(name: "vmess-config")
  final String vmessConfig;
  @JsonKey(name: "authentication")
  final dynamic authentication;
  @JsonKey(name: "skip-auth-prefixes")
  final dynamic skipAuthPrefixes;
  @JsonKey(name: "lan-allowed-ips")
  final List<String> lanAllowedIps;
  @JsonKey(name: "lan-disallowed-ips")
  final dynamic lanDisallowedIps;
  @JsonKey(name: "allow-lan")
  final bool allowLan;
  @JsonKey(name: "bind-address")
  final String bindAddress;
  @JsonKey(name: "inbound-tfo")
  final bool inboundTfo;
  @JsonKey(name: "inbound-mptcp")
  final bool inboundMptcp;
  @JsonKey(name: "mode")
  final String mode;
  @JsonKey(name: "UnifiedDelay")
  final bool unifiedDelay;
  @JsonKey(name: "log-level")
  final String logLevel;
  @JsonKey(name: "ipv6")
  final bool ipv6;
  @JsonKey(name: "interface-name")
  final String interfaceName;
  @JsonKey(name: "geox-url")
  final GeoxUrl geoxUrl;
  @JsonKey(name: "geo-auto-update")
  final bool geoAutoUpdate;
  @JsonKey(name: "geo-update-interval")
  final int geoUpdateInterval;
  @JsonKey(name: "geodata-mode")
  final bool geodataMode;
  @JsonKey(name: "geodata-loader")
  final String geodataLoader;
  @JsonKey(name: "geosite-matcher")
  final String geositeMatcher;
  @JsonKey(name: "tcp-concurrent")
  final bool tcpConcurrent;
  @JsonKey(name: "find-process-mode")
  final String findProcessMode;
  @JsonKey(name: "sniffing")
  final bool sniffing;
  @JsonKey(name: "global-client-fingerprint")
  final String globalClientFingerprint;
  @JsonKey(name: "global-ua")
  final String globalUa;

  ClashConfig({
    required this.port,
    required this.socksPort,
    required this.redirPort,
    required this.tproxyPort,
    required this.mixedPort,
    required this.tun,
    required this.tuicServer,
    required this.ssConfig,
    required this.vmessConfig,
    required this.authentication,
    required this.skipAuthPrefixes,
    required this.lanAllowedIps,
    required this.lanDisallowedIps,
    required this.allowLan,
    required this.bindAddress,
    required this.inboundTfo,
    required this.inboundMptcp,
    required this.mode,
    required this.unifiedDelay,
    required this.logLevel,
    required this.ipv6,
    required this.interfaceName,
    required this.geoxUrl,
    required this.geoAutoUpdate,
    required this.geoUpdateInterval,
    required this.geodataMode,
    required this.geodataLoader,
    required this.geositeMatcher,
    required this.tcpConcurrent,
    required this.findProcessMode,
    required this.sniffing,
    required this.globalClientFingerprint,
    required this.globalUa,
  });

  ClashConfig copyWith({
    int? port,
    int? socksPort,
    int? redirPort,
    int? tproxyPort,
    int? mixedPort,
    Tun? tun,
    TuicServer? tuicServer,
    String? ssConfig,
    String? vmessConfig,
    dynamic authentication,
    dynamic skipAuthPrefixes,
    List<String>? lanAllowedIps,
    dynamic lanDisallowedIps,
    bool? allowLan,
    String? bindAddress,
    bool? inboundTfo,
    bool? inboundMptcp,
    String? mode,
    bool? unifiedDelay,
    String? logLevel,
    bool? ipv6,
    String? interfaceName,
    GeoxUrl? geoxUrl,
    bool? geoAutoUpdate,
    int? geoUpdateInterval,
    bool? geodataMode,
    String? geodataLoader,
    String? geositeMatcher,
    bool? tcpConcurrent,
    String? findProcessMode,
    bool? sniffing,
    String? globalClientFingerprint,
    String? globalUa,
  }) =>
      ClashConfig(
        port: port ?? this.port,
        socksPort: socksPort ?? this.socksPort,
        redirPort: redirPort ?? this.redirPort,
        tproxyPort: tproxyPort ?? this.tproxyPort,
        mixedPort: mixedPort ?? this.mixedPort,
        tun: tun ?? this.tun,
        tuicServer: tuicServer ?? this.tuicServer,
        ssConfig: ssConfig ?? this.ssConfig,
        vmessConfig: vmessConfig ?? this.vmessConfig,
        authentication: authentication ?? this.authentication,
        skipAuthPrefixes: skipAuthPrefixes ?? this.skipAuthPrefixes,
        lanAllowedIps: lanAllowedIps ?? this.lanAllowedIps,
        lanDisallowedIps: lanDisallowedIps ?? this.lanDisallowedIps,
        allowLan: allowLan ?? this.allowLan,
        bindAddress: bindAddress ?? this.bindAddress,
        inboundTfo: inboundTfo ?? this.inboundTfo,
        inboundMptcp: inboundMptcp ?? this.inboundMptcp,
        mode: mode ?? this.mode,
        unifiedDelay: unifiedDelay ?? this.unifiedDelay,
        logLevel: logLevel ?? this.logLevel,
        ipv6: ipv6 ?? this.ipv6,
        interfaceName: interfaceName ?? this.interfaceName,
        geoxUrl: geoxUrl ?? this.geoxUrl,
        geoAutoUpdate: geoAutoUpdate ?? this.geoAutoUpdate,
        geoUpdateInterval: geoUpdateInterval ?? this.geoUpdateInterval,
        geodataMode: geodataMode ?? this.geodataMode,
        geodataLoader: geodataLoader ?? this.geodataLoader,
        geositeMatcher: geositeMatcher ?? this.geositeMatcher,
        tcpConcurrent: tcpConcurrent ?? this.tcpConcurrent,
        findProcessMode: findProcessMode ?? this.findProcessMode,
        sniffing: sniffing ?? this.sniffing,
        globalClientFingerprint:
            globalClientFingerprint ?? this.globalClientFingerprint,
        globalUa: globalUa ?? this.globalUa,
      );

  factory ClashConfig.fromJson(Map<String, dynamic> json) =>
      _$ClashConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ClashConfigToJson(this);
}

@JsonSerializable()
class GeoxUrl {
  @JsonKey(name: "geoip")
  final String geoip;
  @JsonKey(name: "mmdb")
  final String mmdb;
  @JsonKey(name: "geosite")
  final String geosite;

  GeoxUrl({
    required this.geoip,
    required this.mmdb,
    required this.geosite,
  });

  GeoxUrl copyWith({
    String? geoip,
    String? mmdb,
    String? geosite,
  }) =>
      GeoxUrl(
        geoip: geoip ?? this.geoip,
        mmdb: mmdb ?? this.mmdb,
        geosite: geosite ?? this.geosite,
      );

  factory GeoxUrl.fromJson(Map<String, dynamic> json) =>
      _$GeoxUrlFromJson(json);

  Map<String, dynamic> toJson() => _$GeoxUrlToJson(this);
}

@JsonSerializable()
class TuicServer {
  @JsonKey(name: "enable")
  final bool enable;
  @JsonKey(name: "listen")
  final String listen;
  @JsonKey(name: "certificate")
  final String certificate;
  @JsonKey(name: "private-key")
  final String privateKey;
  @JsonKey(name: "mux-option")
  final MuxOption muxOption;

  TuicServer({
    required this.enable,
    required this.listen,
    required this.certificate,
    required this.privateKey,
    required this.muxOption,
  });

  TuicServer copyWith({
    bool? enable,
    String? listen,
    String? certificate,
    String? privateKey,
    MuxOption? muxOption,
  }) =>
      TuicServer(
        enable: enable ?? this.enable,
        listen: listen ?? this.listen,
        certificate: certificate ?? this.certificate,
        privateKey: privateKey ?? this.privateKey,
        muxOption: muxOption ?? this.muxOption,
      );

  factory TuicServer.fromJson(Map<String, dynamic> json) =>
      _$TuicServerFromJson(json);

  Map<String, dynamic> toJson() => _$TuicServerToJson(this);
}

@JsonSerializable()
class MuxOption {
  @JsonKey(name: "brutal")
  final Brutal brutal;

  MuxOption({
    required this.brutal,
  });

  MuxOption copyWith({
    Brutal? brutal,
  }) =>
      MuxOption(
        brutal: brutal ?? this.brutal,
      );

  factory MuxOption.fromJson(Map<String, dynamic> json) =>
      _$MuxOptionFromJson(json);

  Map<String, dynamic> toJson() => _$MuxOptionToJson(this);
}

@JsonSerializable()
class Brutal {
  @JsonKey(name: "enabled")
  final bool enabled;

  Brutal({
    required this.enabled,
  });

  Brutal copyWith({
    bool? enabled,
  }) =>
      Brutal(
        enabled: enabled ?? this.enabled,
      );

  factory Brutal.fromJson(Map<String, dynamic> json) => _$BrutalFromJson(json);

  Map<String, dynamic> toJson() => _$BrutalToJson(this);
}

@JsonSerializable()
class Tun {
  @JsonKey(name: "enable")
  final bool enable;
  @JsonKey(name: "device")
  final String device;
  @JsonKey(name: "stack")
  final String stack;
  @JsonKey(name: "dns-hijack")
  final List<String> dnsHijack;
  @JsonKey(name: "auto-route")
  final bool autoRoute;
  @JsonKey(name: "auto-detect-interface")
  final bool autoDetectInterface;
  @JsonKey(name: "inet4-address")
  final List<String> inet4Address;
  @JsonKey(name: "file-descriptor")
  final int fileDescriptor;

  Tun({
    required this.enable,
    required this.device,
    required this.stack,
    required this.dnsHijack,
    required this.autoRoute,
    required this.autoDetectInterface,
    required this.inet4Address,
    required this.fileDescriptor,
  });

  Tun copyWith({
    bool? enable,
    String? device,
    String? stack,
    List<String>? dnsHijack,
    bool? autoRoute,
    bool? autoDetectInterface,
    List<String>? inet4Address,
    int? fileDescriptor,
  }) =>
      Tun(
        enable: enable ?? this.enable,
        device: device ?? this.device,
        stack: stack ?? this.stack,
        dnsHijack: dnsHijack ?? this.dnsHijack,
        autoRoute: autoRoute ?? this.autoRoute,
        autoDetectInterface: autoDetectInterface ?? this.autoDetectInterface,
        inet4Address: inet4Address ?? this.inet4Address,
        fileDescriptor: fileDescriptor ?? this.fileDescriptor,
      );

  factory Tun.fromJson(Map<String, dynamic> json) => _$TunFromJson(json);

  Map<String, dynamic> toJson() => _$TunToJson(this);
}
