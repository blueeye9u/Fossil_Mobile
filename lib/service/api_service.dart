// ignore_for_file: unnecessary_string_interpolations, depend_on_referenced_packages

import 'package:fossil_mobile/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String apiURL = '${APIConfig.baseUrl}';

  Future<Map<String, dynamic>> get(String endpoint, String? authToken,
      {List<String> errorFields = const []}) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      if (authToken != null && authToken.isNotEmpty) {
        headers['Authorization'] = 'Bearer $authToken';
      }

      final response =
          await http.get(Uri.parse('$apiURL/$endpoint'), headers: headers);
      return _handleResponse(response, errorFields: errorFields);
    } catch (e) {
      return {'success': false, 'error': 'Network error : $e'};
    }
  }

  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data,
      {String? authToken, List<String> errorFields = const []}) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      if (authToken != null) {
        headers['Authorization'] = 'Bearer $authToken';
      }

      final response = await http.post(
        Uri.parse('$apiURL/$endpoint'),
        headers: headers,
        body: json.encode(data),
      );

      return _handleResponse(response, errorFields: errorFields);
    } catch (e) {
      return {'success': false, 'error': 'Network error : $e'};
    }
  }

  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data,
      {List<String> errorFields = const []}) async {
    try {
      final response = await http.put(
        Uri.parse('$apiURL/$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      return _handleResponse(response, errorFields: errorFields);
    } catch (e) {
      return {'success': false, 'error': 'Network error : $e'};
    }
  }

  Future<Map<String, dynamic>> delete(String endpoint, String? authToken,
      {List<String> errorFields = const []}) async {
    try {
      final response = await http.delete(
        Uri.parse('$apiURL/$endpoint'),
        headers: {
          'Authorization':
              'Bearer $authToken', // Replace 'Bearer' with your authentication method
          // Add any other headers you need here
        },
      );
      return _handleResponse(response, errorFields: errorFields);
    } catch (e) {
      return {'success': false, 'error': 'Network error : $e'};
    }
  }

  Future<Map<String, dynamic>> patch(String endpoint, Map<String, dynamic> data,
      {List<String> errorFields = const []}) async {
    try {
      final response = await http.patch(
        Uri.parse('$apiURL/$endpoint'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(data),
      );
      return _handleResponse(response, errorFields: errorFields);
    } catch (e) {
      return {'success': false, 'error': 'Network error : $e'};
    }
  }

  // Add a new parameter named 'requestPurpose' to _handleResponse
  Map<String, dynamic> _handleResponse(http.Response response,
      {List<String>? errorFields}) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return {'success': true, 'data': responseData};
    } else {
      final Map<String, dynamic> errorResponse = json.decode(response.body);
      return {'success': false, 'error': errorResponse['message']};
    }
  }
}
