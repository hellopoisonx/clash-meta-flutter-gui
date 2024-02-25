import 'package:json_annotation/json_annotation.dart';

part 'logs.g.dart';

class Logs {
  List<LogItem> logList = [];
  prepend(Map<String, dynamic> json) =>
      logList.insert(0, LogItem.fromJson(json));
}

@JsonSerializable()
class LogItem {
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "payload")
  final String payload;

  LogItem({
    required this.type,
    required this.payload,
  });

  LogItem copyWith({
    String? type,
    String? payload,
  }) =>
      LogItem(
        type: type ?? this.type,
        payload: payload ?? this.payload,
      );

  factory LogItem.fromJson(Map<String, dynamic> json) =>
      _$LogItemFromJson(json);

  Map<String, dynamic> toJson() => _$LogItemToJson(this);
}
