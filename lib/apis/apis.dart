import 'package:clash_meta_flutter/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://localhost:9090/",
    receiveTimeout: const Duration(seconds: 10)));
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
