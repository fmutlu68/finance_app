import 'package:flutter/material.dart';

class TextFieldProperties {
  final TextEditingController? textController;
  final TextInputType? keyboard;
  final TextStyle? inputStyle;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final EdgeInsets padding;
  final bool obscureText;
  final bool isInsideForm;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  const TextFieldProperties({
    this.keyboard,
    this.textController,
    this.validator,
    this.inputStyle,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.decoration,
    this.padding = const EdgeInsets.all(20.0),
    this.isInsideForm = false,
    this.obscureText = false,
  });
}
