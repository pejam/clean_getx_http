import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../error_handling/exception_handler.dart';
import '../error_handling/http_error.dart';
import '../error_handling/wrapper_exception.dart';
import '../model/wrapper_error.dart';
import 'api_config.dart';

class ApiProvider {
  final http.Client httpClient;
  final ApiConfig apiConfig;

  ApiProvider({
    required this.httpClient,
    required this.apiConfig,
  });

  Future getRequest(
      {required String route,
      String? params,
      dynamic Function(Map<String, dynamic> json)? getJsonCallback}) async {
    return _requestBuilder(
        httpClient.get(
          Uri.parse(params == null
              ? '${apiConfig.baseUrl}$route'
              : '${apiConfig.baseUrl}$route?$params'),
          headers: _headers(),
        ),
        getJsonCallback);
  }

  Future<dynamic> postRequest(
      {required String route,
      String? params,
      required Object body,
      dynamic Function(Map<String, dynamic> json)? getJsonCallback}) async {
    return _requestBuilder(
        httpClient.post(
          Uri.parse(params == null
              ? '${apiConfig.baseUrl}/$route'
              : '${apiConfig.baseUrl}/$route?$params'),
          headers: _headers(),
          body: utf8.encode(
            json.encode(body),
          ),
        ),
        getJsonCallback);
  }

  Future<dynamic> putRequest(
      {required String route,
      String? params,
      required Object body,
      dynamic Function(Map<String, dynamic> json)? getJsonCallback}) async {
    return _requestBuilder(
        httpClient.put(
          Uri.parse(params == null
              ? '${apiConfig.baseUrl}/$route'
              : '${apiConfig.baseUrl}/$route?$params'),
          headers: _headers(),
          body: utf8.encode(
            json.encode(body),
          ),
        ),
        getJsonCallback);
  }

  Future _requestBuilder(Future<Response> request,
      dynamic Function(Map<String, dynamic> json)? getJsonCallback) async {
    try {
      final response = await request.timeout(
        Duration(seconds: apiConfig.connectionTimeout),
        onTimeout: () {
          return throw WrapperException.handleWrapperException(
              HttpError.UNAVAILABLE);
        },
      );

      return _response(response, getJsonCallback);
    } on ArgumentError catch (_) {
      throw WrapperException.handleWrapperException(HttpError.INVALID_ARGUMENT);
    } on SocketException catch (_) {
      throw WrapperException.handleWrapperException(HttpError.NO_CONNECTION);
    } on ExceptionHandler catch (_) {
      throw (_ as WrapperError);
    }
  }

  dynamic _response(http.Response response,
      dynamic Function(Map<String, dynamic> json)? getJsonCallback) {
    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        return true;
      } else {
        dynamic d = getJsonCallback!(jsonDecode(response.body));
        return d;
      }
    } else if (response.statusCode == HttpError.BAD_REQUEST.value) {
      throw WrapperException.handleWrapperException(HttpError.UNAVAILABLE);
    } else if (response.statusCode == HttpError.UNAUTHORIZED.value) {
      throw WrapperException.handleWrapperException(HttpError.UNAUTHORIZED);
    } else if (response.statusCode == HttpError.NOT_FOUND.value) {
      throw WrapperException.handleWrapperException(HttpError.NOT_FOUND);
    } else if (response.statusCode == HttpError.INTERNAL_ERROR.value) {
      throw WrapperException.handleWrapperException(HttpError.INTERNAL_ERROR);
    } else if (response.statusCode == HttpError.UNAVAILABLE.value) {
      throw WrapperException.handleWrapperException(HttpError.UNAVAILABLE);
    }
    /*if (response.statusCode == 200) {
      return WrapperResponse.fromJson(jsonDecode(response.body)).data;
    } else if (response.statusCode == HttpError.BAD_REQUEST.value) {
      throw WrapperExcepti on.badRequest(
        WrapperResponse.fromJson(jsonDecode(response.body)),
      );
    } else if (response.statusCode == HttpError.UNAUTHORIZED.value) {
      throw WrapperException.handleWrapperException(HttpError.UNAUTHORIZED);
    } else if (response.statusCode == HttpError.FORBIDDEN.value) {
      throw WrapperError(
        status: 'ERR',
        code: response.statusCode.toString(),
        message: utf8.decode(String.fromCharCodes(response.bodyBytes)
            .replaceAll('"', '')
            .runes
            .toList()),
      );
      throw WrapperException.handleWrapperException(HttpError.FORBIDDEN);
    } else if (response.statusCode == HttpError.NOT_FOUND.value) {
      throw WrapperException.handleWrapperException(HttpError.NOT_FOUND);
    } else if (response.statusCode == HttpError.INTERNAL_ERROR.value) {
      throw WrapperException.handleWrapperException(HttpError.INTERNAL_ERROR);
    } else if (response.statusCode == HttpError.UNAVAILABLE.value) {
      throw WrapperException.handleWrapperException(HttpError.UNAVAILABLE);
    }*/
  }

  Map<String, String> _headers() {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*'
    });

    /*if (apiConfig.token != null) {
      headers.putIfAbsent(
        'Authorization',
        () => 'Bearer ${InitializeInfo.token}',
      );
    }*/

    return headers;
  }
}
