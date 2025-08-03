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

  String get message => switch (this) {
    NetworkFailure.badRequest => "Bad request. Please check your input.",
    NetworkFailure.unauthorized => "Unauthorized access. Please log in.",
    NetworkFailure.notFound => "Resource not found.",
    NetworkFailure.internalServerError =>
      "Internal server error. Please try again later.",
    _ => "An unknown error occurred.",
  };
}
