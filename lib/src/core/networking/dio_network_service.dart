import 'package:dio/dio.dart';

abstract class DioNetworkService {
  DioNetworkService({
    required String baseApiUrl,
    this.showDebugInfo = false,
  }) {
    configureDio(baseApiUrl);
  }

  late final Dio dio;
  late String baseApiUrl;
  final bool showDebugInfo;

  void configureDio(String baseApiUrl) {
    final options = BaseOptions(
      baseUrl: baseApiUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Add any request modifications here
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
              // Handle response data
              return handler.next(response);
            },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // Handle errors
          return handler.next(error);
        },
      ),
    );

    if (showDebugInfo) {
      dio.interceptors.add(
        LogInterceptor(
          // Whether to log the response body (can be large)
          responseBody: true,
          // Whether to log errors
          error: true,
          // Whether to log requests
          request: true,
          // Whether to log request headers
          requestHeader: true,
          // Whether to log response headers
          responseHeader: true,
        ),
      );
    }
  }

  void dispose() {
    dio.close();
  }
}
