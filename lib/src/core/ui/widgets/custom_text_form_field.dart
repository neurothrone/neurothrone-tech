import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.labelText,
    this.hintText,
    this.hasClearButton = false,
    this.maxLines = 1,
    this.maxLength,
    this.onFieldSubmitted,
    this.validator,
    this.onCleared,
    this.focusNode,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputAction,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool hasClearButton;
  final int? maxLines;
  final int? maxLength;
  final Function(String) onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Function? onCleared;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      onChanged: (_) => onChanged(controller.text),
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: theme.colorScheme.primary,
      maxLines: maxLines,
      maxLength: maxLength,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      keyboardType: keyboardType ?? TextInputType.text,
      style: TextStyle(color: theme.colorScheme.onSurface),
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: hasClearButton
            ? IconButton(
                onPressed: () {
                  controller.clear();
                  onCleared?.call();
                },
                icon: Icon(Icons.clear, color: theme.colorScheme.error),
                tooltip: "Clear",
              )
            : null,
        alignLabelWithHint: true,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.elevation),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.elevation),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(AppDimensions.elevation),
        ),
      ),
    );
  }
}
