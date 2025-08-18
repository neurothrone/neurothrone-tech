import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'contact_form_notifier.dart';
import 'contact_form_state.dart';

final contactFormStateProvider =
    StateNotifierProvider.autoDispose<ContactFormNotifier, ContactFormState>(
      (ref) => ContactFormNotifier(),
    );
