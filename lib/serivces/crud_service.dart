import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants/consts_data.dart';

class CrudService {
  Future<http.Response> get(String url, {Map<String, String>? headers}) async {
    headers = headers ?? {};
    headers['Authorization'] = 'Bearer ' + API_KEY;
    return await http.get(Uri.parse(url), headers: headers);
  }

  Future<http.Response> post(String url, {Map<String, String>? headers, dynamic body}) async {
    headers = headers ?? {};
    headers['Authorization'] = 'Bearer ' + API_KEY;
    return await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );
  }

  Future<http.Response> put(String url, {Map<String, String>? headers, dynamic body}) async {
    headers = headers ?? {};
    headers['Authorization'] = 'Bearer ' + API_KEY;
    return await http.put(
      Uri.parse(url),
      headers: headers,
      body: json.encode(body),
    );
  }

  Future<http.Response> delete(String url, {Map<String, String>? headers}) async {
    headers = headers ?? {};
    headers['Authorization'] = 'Bearer ' + API_KEY;
    return await http.delete(Uri.parse(url), headers: headers);
  }
}
 