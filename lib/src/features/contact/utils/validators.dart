bool isValidEmail(String value) {
  final emailRegex = RegExp(r"^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$");
  return emailRegex.hasMatch(value);
}

String? emailValidator(String? value) {
  final text = value?.trim() ?? "";
  if (text.isEmpty) {
    return "Email cannot be empty";
  }
  if (!isValidEmail(text)) {
    return "Invalid email format";
  }
  return null;
}

String? nonEmptyValidator(String? value, {String fieldName = "Field"}) {
  final text = value?.trim() ?? "";
  if (text.isEmpty) {
    return "$fieldName cannot be empty";
  }
  return null;
}
