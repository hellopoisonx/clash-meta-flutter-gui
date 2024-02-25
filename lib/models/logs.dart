import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logs.g.dart';

class Logs extends ChangeNotifier {
  List<Set<dynamic>> logList = [];
  updateLogList(Map<String, dynamic> json) {
    logList.insert(0, {LogItem.fromJson(json), DateTime.now().toString()});
    notifyListeners();
  }
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
