import 'package:dio/dio.dart';

import '../utils/network_failure.dart';

NetworkFailure mapDioExceptionToNetworkFailure(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return NetworkFailure.timeout;
    case DioExceptionType.badResponse:
      return NetworkFailure.fromStatusCode(e.response?.statusCode);
    case DioExceptionType.connectionError:
      return NetworkFailure.noInternetConnection;
    case DioExceptionType.cancel:
    default:
      return NetworkFailure.unknownError;
  }
}
