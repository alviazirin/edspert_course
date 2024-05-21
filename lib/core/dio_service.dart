import 'package:dio/dio.dart';
import 'package:edspert_course/core/api_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService {
  late Dio _dio;
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  DioService._internal() {
    initializeDio();
  }

  Future<void> initializeDio() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiContants.apiUrl,
        // connectTimeout: const Duration(seconds: 5),
        // receiveTimeout: const Duration(seconds: 3),
        headers: ApiContants.headers,
      ),
    );

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseBody: true));
    }
  }

  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    return _dio.get(url, queryParameters: params);
  }

  Future<Response> postRaw(String url, {Map<String, dynamic>? data}) async {
    return _dio.post(url, data: data);
  }

  Future<Response> postFormData(String url, {FormData? data}) async {
    return _dio.post(url, data: data);
  }

  // Add other methods like put, delete, etc. as needed
}
