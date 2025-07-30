import '../utils/network_failure.dart';

extension NetworkFailureExtension on NetworkFailure {
  String get message => switch (this) {
    NetworkFailure.badRequest => "Bad request. Please check your input.",
    NetworkFailure.unauthorized => "Unauthorized access. Please log in.",
    NetworkFailure.notFound => "Resource not found.",
    NetworkFailure.internalServerError =>
      "Internal server error. Please try again later.",
    _ => "An unknown error occurred.",
  };
}
