import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpService {
  static final String baseUrl = '/localhost:6868';

  static Future<http.Response> get(String uri, {Map<String, dynamic> queryParams, Map<String, String> headers}) {
    var url = Uri.http(baseUrl, uri, queryParams);
    return http.get(url, headers : headers);
  }

  static Future<http.Response> post(String uri, {dynamic body, Map<String, String> headers}) {
    var url = Uri.http(baseUrl, uri);
    return http.post(url, body: body, headers: headers);
  }

  static Future<http.Response> put(String uri, {Map<String, dynamic> body, Map<String, String> headers}) {
    var url = Uri.http(baseUrl, uri);
    return http.put(url, body: body, headers: headers);
  }

  static Future<http.Response> delete(String uri, {Map<String, String> headers}) {
    var url = Uri.http(baseUrl, uri);
    return http.delete(url, headers: headers);
  }
}