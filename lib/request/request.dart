import 'dart:convert';

import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;
  // final String? token;
  final dynamic body;

  ApiRequest({
    required this.url,
    this.data,
    this.body,
    // this.token,
  });

  Dio _dio() {
    return Dio(BaseOptions(
      headers: {
        // 'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    ));
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  }) async {
    try {
      final response = await _dio().get(url, queryParameters: data);
      if (onSuccess != null) {
        // var responseBody = json.encode(response.data);
        onSuccess(json.decode(response.data));
      }
    } on DioError catch (error) {
      if (onError != null) onError(error);
      print(error.message);
    }
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(DioError error)? onError,
  }) async {
    try {
      final response = await _dio().post(
        url,
        queryParameters: data,
        data: FormData.fromMap(body),
      );
      if (onSuccess != null) {
        if (response.statusCode == 200) {
          var responseBody = json.encode(response.data);
          onSuccess(json.decode(responseBody));
        } else if (response.statusCode == 422) print('Failed');
      }
    } on DioError catch (error) {
      if (onError != null) {
        onError(error);
        print(error.type);
      }
    }
  }
}
