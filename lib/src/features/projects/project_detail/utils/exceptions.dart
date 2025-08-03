class ProjectNotFoundException implements Exception {
  ProjectNotFoundException(this.slug);

  final String slug;

  @override
  String toString() => "The project with slug '$slug' could not be found.";
}

class ProjectLoadException implements Exception {
  // To store the original NetworkFailure or other error
  ProjectLoadException(this.message, {this.originalError});

  final String message;
  final dynamic originalError;

  @override
  String toString() => message;
}
