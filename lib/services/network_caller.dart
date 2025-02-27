import 'dart:convert';
import 'package:ecomers_app/features/common/ui/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
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
  Future<NetworkResponse> getRequest(String url, {Map<String, dynamic>? queryParam,String? accessToken}) async {
    try {

      Map<String, String> headers = {
        'content-type': 'application/json',
      };
      if (accessToken != null) {
        headers['token'] = accessToken;
      }
      _logRequest(url);

      if(queryParam!=null){
        url+='?';
        for(String param in queryParam.keys){
          String paramName=param;
          int? paramValue=queryParam[param];
          url+= paramName;
          url+='=';
          url+= paramValue.toString();
          url+= '&';
        }
      }
      Uri uri = Uri.parse(url);
      http.Response response = await get(uri, headers: headers);
      _logResponse(url, response.statusCode, response.headers, response.body);
      if (response.statusCode == 200) {
        final decodedMessage = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedMessage);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode);
      }
    } catch (e) {
      _logResponse(url, -1, null, '', e.toString());
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }
  Future<NetworkResponse> delRequest(String url, {String? accessToken}) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
      };

      if (accessToken != null) {
        headers['token'] = accessToken;
      }

      _logRequest(url);

      Uri uri = Uri.parse(url);
      http.Response response = await http.delete(uri, headers: headers);

      _logResponse(url, response.statusCode, response.headers, response.body);

      if (response.statusCode == 200) {
        final decodedMessage = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedMessage);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode);
      }
    } catch (e) {
      _logResponse(url, -1, {}, '', e.toString());
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }


  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
      };
      _logRequest(url, headers, body);
      http.Response response =
      await post(uri, headers: headers, body: jsonEncode(body));
      _logResponse(url, response.statusCode, response.headers, response.body);
      if (response.statusCode == 200||response.statusCode==201) {
        final decodedMessage = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedMessage);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode);
      }
    } catch (e) {
      _logResponse(url, -1, null, '', e.toString());
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }

  void _logRequest(String url,
      [Map<String, dynamic>? headers, Map<String, dynamic>? body]) {
    _logger.i('URL => $url\nHeaders => $headers\nBODY => $body');
  }

  void _logResponse(
      String url, int statusCode, Map<String, String>? headers, String body,
      [String? errorMessage]) {
    if (errorMessage != null) {
      _logger.e('URL => $url\nError Message => $errorMessage');
    } else {
      _logger.i(
          'URL => $url\nHeaders => $headers\nStatus code => $statusCode\nBODY => $body');
    }
  }
  Future<NetworkResponse> patchRequest(String url, {Map<String, dynamic>? body, String? accessToken}) async {
    try {
      Map<String, String> headers = {
        'content-type': 'application/json',
      };
      if (accessToken != null) {
        headers['token'] = accessToken;
      }

      _logRequest(url, headers, body);

      Uri uri = Uri.parse(url);
      http.Response response = await patch(uri, headers: headers, body: jsonEncode(body));
      _logResponse(url, response.statusCode, response.headers, response.body);

      if (response.statusCode == 200) {
        final decodedMessage = jsonDecode(response.body);
        return NetworkResponse(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodedMessage);
      } else {
        return NetworkResponse(
            isSuccess: false, statusCode: response.statusCode);
      }
    } catch (e) {
      _logResponse(url, -1, null, '', e.toString());
      return NetworkResponse(
          isSuccess: false, statusCode: -1, errorMessage: e.toString());
    }
  }


}