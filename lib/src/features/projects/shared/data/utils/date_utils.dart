import 'package:intl/intl.dart';

/// Parsing function to be used by @JsonKey in the [freezed] models
DateTime? parseDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return null;
  }
  // Expected date format is: 2025-07-01T00:22:17.079Z
  return DateFormat("yyyy-MM-dd").parse(dateString);
}
