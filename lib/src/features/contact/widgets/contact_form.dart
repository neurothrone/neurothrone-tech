import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/widgets.dart';
import '../state/contact_form_notifier.dart';
import '../state/contact_form_state.dart';
import '../state/providers.dart';
import '../utils/utils.dart';

class ContactForm extends ConsumerStatefulWidget {
  const ContactForm({super.key});

  @override
  ConsumerState<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends ConsumerState<ContactForm> {
  final _formKey = GlobalKey<FormState>();

  late final ContactFormNotifier _formController;

  late final TextEditingController _emailController;
  late final TextEditingController _subjectController;
  late final TextEditingController _messageController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _subjectFocusNode;
  late final FocusNode _messageFocusNode;

  @override
  void initState() {
    super.initState();

    _formController = ref.read(contactFormStateProvider.notifier);

    _emailController = TextEditingController();
    _subjectController = TextEditingController();
    _messageController = TextEditingController();

    _emailFocusNode = FocusNode();
    _subjectFocusNode = FocusNode();
    _messageFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();

    _emailFocusNode.dispose();
    _subjectFocusNode.dispose();
    _messageFocusNode.dispose();

    super.dispose();
  }

  void _submitForm(ContactFormState state) {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(contactFormStateProvider);

    return Form(
      key: _formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFormField(
            controller: _emailController,
            labelText: "Email",
            hasClearButton: true,
            keyboardType: TextInputType.emailAddress,
            hintText: "Enter your email",
            maxLength: 254,
            validator: (value) => emailValidator(value),
            textCapitalization: TextCapitalization.none,
            textInputAction: TextInputAction.next,
            focusNode: _emailFocusNode,
            onChanged: _formController.setEmail,
            onFieldSubmitted: (String value) {
              _formController.setEmail(value);
              _subjectFocusNode.requestFocus();
            },
            onCleared: () => _formController.setEmail(""),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: _subjectController,
            labelText: "Subject",
            hasClearButton: true,
            keyboardType: TextInputType.text,
            hintText: "Enter the subject",
            maxLength: 100,
            validator: (value) => nonEmptyValidator(
              value,
              fieldName: "Subject",
            ),
            textCapitalization: TextCapitalization.none,
            textInputAction: TextInputAction.next,
            focusNode: _subjectFocusNode,
            onChanged: _formController.setSubject,
            onFieldSubmitted: (String value) {
              _formController.setSubject(value);
              _messageFocusNode.requestFocus();
            },
            onCleared: () => _formController.setSubject(""),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: _messageController,
            labelText: "Message",
            hasClearButton: true,
            keyboardType: TextInputType.text,
            hintText: "Enter your message",
            maxLines: 5,
            maxLength: 500,
            validator: (value) => nonEmptyValidator(
              value,
              fieldName: "Message",
            ),
            textCapitalization: TextCapitalization.none,
            textInputAction: TextInputAction.next,
            focusNode: _messageFocusNode,
            onChanged: _formController.setMessage,
            onFieldSubmitted: (String value) {
              _formController.setMessage(value);
              _submitForm(formState);
            },
            onCleared: () => _formController.setMessage(""),
          ),
          const SizedBox(height: 16),
          // TODO: button to submit the form
        ],
      ),
    );
  }
}
