import 'dart:convert';
import 'dart:io'; // Added for SocketException
import 'package:ecomers_app/features/common/model/error_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final dynamic responseData;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  Future<NetworkResponse> getRequest(String url, {Map<String, dynamic>? queryParam, String? accessToken}) async {
    try {
      Map<String, String> headers = {'content-type': 'application/json'};
      if (accessToken != null) {
        headers['token'] = accessToken;
      }

      if (queryParam != null) {
        url += '?';
        for (String param in queryParam.keys) {
          url += "$param=${queryParam[param]}&";
        }
        url = url.substring(0, url.length - 1);
        _logRequest(url);
      }

      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri, headers: headers);

      _logResponse(url, response.statusCode, response.headers, response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: jsonDecode(response.body),
        );
      } else {
        ErrorResponseModel errorResponseModel = ErrorResponseModel.fromJson(jsonDecode(response.body));
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: errorResponseModel.msg,
        );
      }
    } on SocketException {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: "No Internet Connection",
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(String url, {Map<String, dynamic>? body, String? accessToken}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {'content-type': 'application/json'};
      if (accessToken != null) {
        headers['token'] = accessToken;
      }
      _logRequest(url, headers, body);

      http.Response response = await http.post(uri, headers: headers, body: jsonEncode(body));

      _logResponse(url, response.statusCode, response.headers, response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: jsonDecode(response.body),
        );
      } else {
        ErrorResponseModel errorResponseModel = ErrorResponseModel.fromJson(jsonDecode(response.body));
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: errorResponseModel.msg,
        );
      }
    } on SocketException {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: "No Internet Connection",
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> delRequest(String url, {String? accessToken}) async {
    try {
      Map<String, String> headers = {'content-type': 'application/json'};
      if (accessToken != null) {
        headers['token'] = accessToken;
      }

      _logRequest(url);
      Uri uri = Uri.parse(url);
      http.Response response = await http.delete(uri, headers: headers);

      _logResponse(url, response.statusCode, response.headers, response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: jsonDecode(response.body),
        );
      } else {
        ErrorResponseModel errorResponseModel = ErrorResponseModel.fromJson(jsonDecode(response.body));
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: errorResponseModel.msg,
        );
      }
    } on SocketException {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: "No Internet Connection",
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest(String url, {Map<String, dynamic>? body, String? accessToken}) async {
    try {
      Map<String, String> headers = {'content-type': 'application/json'};
      if (accessToken != null) {
        headers['token'] = accessToken;
      }

      _logRequest(url, headers, body);
      Uri uri = Uri.parse(url);
      http.Response response = await http.patch(uri, headers: headers, body: jsonEncode(body));

      _logResponse(url, response.statusCode, response.headers, response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: jsonDecode(response.body),
        );
      } else {
        ErrorResponseModel errorResponseModel = ErrorResponseModel.fromJson(jsonDecode(response.body));
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: errorResponseModel.msg,
        );
      }
    } on SocketException {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: "No Internet Connection",
      );
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(String url, [Map<String, dynamic>? headers, Map<String, dynamic>? body]) {
    _logger.i('URL => $url\nHeaders => $headers\nBODY => $body');
  }

  void _logResponse(String url, int statusCode, Map<String, String>? headers, String body) {
    _logger.i('URL => $url\nHeaders => $headers\nStatus code => $statusCode\nBODY => $body');
  }
}
