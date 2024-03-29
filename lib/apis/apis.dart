import 'dart:async';
import 'dart:convert';

import 'package:clash_meta_flutter/exceptions/exceptions.dart';
import 'package:clash_meta_flutter/models/clash_mem.dart';
import 'package:clash_meta_flutter/models/connections.dart';
import 'package:clash_meta_flutter/models/logs.dart';
import 'package:clash_meta_flutter/models/traffic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final Dio _dio = Dio(BaseOptions(
  baseUrl: "http://localhost:9090/",
));
String _testUrl = "http://www.gstatic.com/generate_204";
// get proxies
Future<Map<String, dynamic>> getProxies() async {
  try {
    final resp = await _dio.get<Map<String, dynamic>>("/proxies");
    if (resp.statusCode != 200) {
      throw ApiExceptions(err: "getProxies() statusCode: ${resp.statusCode}");
    } else if (resp.data == null) {
      throw ApiExceptions(err: "empty response");
    } else {
      return resp.data!;
    }
  } catch (e) {
    throw ApiExceptions(err: e.toString());
  }
}

Future<Map<String, int>> getSingleNodeDelay(String target) async {
  try {
    final resp = await _dio.get<Map<String, dynamic>>("/proxies/$target/delay",
        queryParameters: {"timeout": 2000, "url": _testUrl});
    if (resp.statusCode != 200) {
      throw ApiExceptions(
          err: "getSingleNodeDelay() statusCode: ${resp.statusCode}");
    }
    if (kDebugMode) {
      print(resp.data!.values.first as int);
    }
    return {target: (resp.data!["delay"] as int)};
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    throw ApiExceptions(err: e.toString());
  }
}

Future<Map<String, dynamic>> getGroupDelay(String target) async {
  try {
    final resp = await _dio.get<Map<String, dynamic>>("/group/$target/delay",
        queryParameters: {"timeout": 2000, "url": _testUrl});
    if (resp.statusCode != 200) {
      throw ApiExceptions(
          err: "getGroupDelay() statusCode: ${resp.statusCode}");
    }
    if (kDebugMode) {
      print(resp.data);
    }
    return resp.data!;
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    throw ApiExceptions(err: e.toString());
  }
}

Future<bool> changeProxyForSelector(String selector, String target) async {
  try {
    final resp =
        await _dio.put("/proxies/$selector", data: "{\"name\":\"$target\"}");
    if (resp.statusCode == 204) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    throw ApiExceptions(err: e.toString());
  }
}

Future<void> getTraffic(Traffic traffic) async {
  final transformer = StreamTransformer<Uint8List, dynamic>.fromHandlers(
      handleData: (data, sink) {
    sink.add(utf8.decode(data));
  });
  try {
    final resp = await _dio.get<ResponseBody>("/traffic",
        options: Options(responseType: ResponseType.stream));
    if (kDebugMode) {
      print(resp.data == null);
    }
    resp.data?.stream.transform(transformer).listen(
      (event) {
        if (kDebugMode) {
          print(event.runtimeType);
        }
        event = json.decode(event);
        final up = event["up"] as int;
        final down = event["down"] as int;
        traffic.updateTraffic(
          parseByte(up.toDouble()),
          parseByte(down.toDouble()),
        );
      },
    );
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    throw ApiExceptions(err: e.toString());
  }
}

String parseByte(double t) {
  // t *= 8;
  int count = 0;
  while (t > 1024) {
    t /= 1024.0;
    ++count;
  }
  final res = t.toInt();
  // final cap = ["bit", "Kb", "Mb", "Gb", "Tb"];
  final cap = ["Byte", "KB", "MB", "GB", "TB"];
  return "$res ${cap[count]}/s";
}

void createLogStream(Logs l) async {
  try {
    final resp = await _dio.get<ResponseBody>("/logs",
        options: Options(responseType: ResponseType.stream));
    await for (var log in resp.data!.stream) {
      final logS = utf8.decode(log);
      l.updateLogList(json.decode(logS));
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    throw ApiExceptions(err: e.toString());
  }
}

void createConnectionStream(ConnectionController conn) async {
  final stream = Stream.periodic(const Duration(seconds: 1), (_) async {
    try {
      final resp = await _dio.get<Map<dynamic, dynamic>>("/connections");
      return resp.data ?? {};
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw ApiExceptions(err: e.toString());
    }
  });
  await for (var connections in stream) {
    final c = await connections;
    conn.update(Connections.fromJson(Map<String, dynamic>.from(c)));
  }
}

void killSingleConnection(String id) {
  try {
    _dio.delete("/connections/$id");
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    throw ApiExceptions(err: e.toString());
  }
}

void killAllConnections() {
  try {
    _dio.delete("/connections");
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    throw ApiExceptions(err: e.toString());
  }
}

Future<void> getMem(ClashMem mem) async {
  final transformer = StreamTransformer<Uint8List, dynamic>.fromHandlers(
      handleData: (data, sink) {
    sink.add(utf8.decode(data));
  });
  try {
    final resp = await _dio.get<ResponseBody>("/memory",
        options: Options(responseType: ResponseType.stream));
    resp.data?.stream.transform(transformer).listen(
      (event) {
        event = json.decode(event);
        final inuse = event["inuse"] as int;
        final oslimit = event["oslimit"] as int;
        mem.update(parseByte(inuse.toDouble()), parseByte(oslimit.toDouble()));
      },
    );
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    throw ApiExceptions(err: e.toString());
  }
}

Future<Map<String, dynamic>> getRules() async {
  try {
    final resp = await _dio.get("/rules");
    if (resp.statusCode == 200) {
      return resp.data;
    } else {
      throw ApiExceptions(err: "getRules() statusCode:${resp.statusCode}");
    }
  } catch (e) {
    throw ApiExceptions(err: e.toString());
  }
}

Future<Map<String, dynamic>> getIpInfo() async {
  try {
    final resp = await Dio().get("https://www.ip.cn/api/index?ip&type=0");
    if (resp.statusCode == 200) {
      return resp.data;
    } else {
      throw ApiExceptions(err: "getIpInfo() statusCode:${resp.statusCode}");
    }
  } catch (e) {
    throw ApiExceptions(err: "getIpInfo() statusCode:");
  }
}
