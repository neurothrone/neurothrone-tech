import 'dart:io';

enum NetworkFailure {
  badRequest,
  unauthorized,
  notFound,
  noInternetConnection,
  serverError,
  tooManyRequests,
  serviceUnavailable,
  timeout,
  internalServerError,
  unknownError;

  factory NetworkFailure.fromStatusCode(
    int? statusCode,
  ) => switch (statusCode) {
    HttpStatus.badRequest => NetworkFailure.badRequest,
    HttpStatus.unauthorized => NetworkFailure.unauthorized,
    HttpStatus.notFound => NetworkFailure.notFound,
    HttpStatus.internalServerError => NetworkFailure.internalServerError,
    _ => NetworkFailure.unknownError,
  };
}
