import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';

@immutable
final class ContactFormState extends Equatable {
  const ContactFormState({
    required this.email,
    required this.subject,
    required this.message,
  });

  factory ContactFormState.initial() => const ContactFormState(
    email: "",
    subject: "",
    message: "",
  );

  final String email;
  final String subject;
  final String message;

  bool get isValid =>
      email.isNotEmpty && subject.isNotEmpty && message.isNotEmpty;

  ContactFormState copyWith({
    String? email,
    String? subject,
    String? message,
  }) {
    return ContactFormState(
      email: email ?? this.email,
      subject: subject ?? this.subject,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [email, subject, message];
}
