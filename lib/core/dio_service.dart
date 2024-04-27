import 'package:dio/dio.dart';
import 'package:edspert_course/core/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioService {
  late Dio _dio;
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  DioService._internal() {
    initializeDio();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> initializeDio() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiContants.apiUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: ApiContants.headers,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          return handler.next(options); // continue
        },

        onError: (DioException e, handler) {
          // Do something on error
          return handler.next(e); // continue
        },
        // ...
      ),
    );
  }

  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    return _dio.get(url, queryParameters: params);
  }

  Future<Response> post(String url, {Map<String, dynamic>? data}) async {
    return _dio.post(url, data: data);
  }

  // Add other methods like put, delete, etc. as needed
}
