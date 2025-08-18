import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contact_form_state.dart';

final class ContactFormNotifier extends StateNotifier<ContactFormState> {
  ContactFormNotifier() : super(ContactFormState.initial());

  void setEmail(String value) {
    state = state.copyWith(email: value);
  }

  void setSubject(String value) {
    state = state.copyWith(subject: value);
  }

  void setMessage(String value) {
    state = state.copyWith(message: value);
  }
}
