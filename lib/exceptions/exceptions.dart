class ApiExceptions implements Exception {
  final String? err;

  ApiExceptions({required this.err});
  String errMsg() => "Error accessing api:${err ?? "unknown"}";
}
