import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio) {
    dio.options = BaseOptions(
      baseUrl: "https://api.example.com", // 🔁 change this
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json",
      },
    );

    _initializeInterceptors();
  }

  void _initializeInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 🔐 Add token here if needed
          // options.headers["Authorization"] = "Bearer TOKEN";
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      ),
    );

    // Logging (dev only)
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  // ✅ GET
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  // ✅ POST
  Future<Response> post(String path, {dynamic data}) async {
    return await dio.post(path, data: data);
  }

  // ✅ PUT
  Future<Response> put(String path, {dynamic data}) async {
    return await dio.put(path, data: data);
  }

  // ✅ DELETE
  Future<Response> delete(String path) async {
    return await dio.delete(path);
  }
}
