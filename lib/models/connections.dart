import 'package:json_annotation/json_annotation.dart';

part 'connections.g.dart';

@JsonSerializable()
class Connections {
  final double downloadTotal;
  final int uploadTotal;
  final List<Connection> connections;
  final int memory;

  Connections(
      {required this.downloadTotal,
      required this.uploadTotal,
      required this.connections,
      required this.memory});

  factory Connections.fromJson(Map<String, dynamic> json) =>
      _$ConnectionsFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectionsToJson(this);
}

@JsonSerializable()
class Connection {
  final String id;
  final Metadata metadata;
  final int upload;
  final int download;
  final String start;
  final List<String> chains;
  final String rule;
  final String rulePayload;

  Connection(
      {required this.id,
      required this.metadata,
      required this.upload,
      required this.download,
      required this.start,
      required this.chains,
      required this.rule,
      required this.rulePayload});

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
  Map<String, dynamic> toJson() => _$ConnectionToJson(this);
}

@JsonSerializable()
class Metadata {
  final String network;
  final String type;
  final String sourceIP;
  final String destinationIP;
  final String sourcePort;
  final String destinationPort;
  final String inboundIP;
  final String inboundPort;
  final String inboundName;
  final String inboundUser;
  final String host;
  final String dnsMode;
  final int uid;
  final String process;
  final String processPath;
  final String specialProxy;
  final String specialRules;
  final String remoteDestination;
  final String sniffHost;

  Metadata(
      {required this.network,
      required this.type,
      required this.sourceIP,
      required this.destinationIP,
      required this.sourcePort,
      required this.destinationPort,
      required this.inboundIP,
      required this.inboundPort,
      required this.inboundName,
      required this.inboundUser,
      required this.host,
      required this.dnsMode,
      required this.uid,
      required this.process,
      required this.processPath,
      required this.specialProxy,
      required this.specialRules,
      required this.remoteDestination,
      required this.sniffHost});

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
