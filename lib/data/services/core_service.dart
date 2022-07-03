import 'dart:convert';

import 'package:http/http.dart' as http;

class CoreService {
  final String _baseUrl;
  final Map<String, String> _headers;
  CoreService(this._baseUrl, this._headers);

  Uri _buildUri(String endPoint, [Map<String, String>? queryParams]) {
    final uri = Uri.parse('${_baseUrl}${endPoint}')
        .replace(queryParameters: queryParams);
    return uri;
  }

  Future<http.Response> get(
      String endPoint, Map<String, String>? queryParams) async {
    return await http.get(_buildUri(endPoint, queryParams), headers: _headers);
  }

  Future<http.Response> post(
      String endPoint, Map<String, String>? queryParams) async {
    return await http.post(_buildUri(endPoint),
        body: jsonEncode(queryParams), headers: _headers);
  }

  Future<http.Response> put(
      String endPoint, Map<String, String>? queryParams) async {
    return await http.put(_buildUri(endPoint),
        body: jsonEncode(queryParams), headers: _headers);
  }
}
