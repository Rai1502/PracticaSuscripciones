import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController? controller,
    required FocusNode? focusNode,
    FocusNode? nextFocusNode,
    this.onChanged,
    this.validator,
    required this.label,
    this.maxLength,
  })  : _controller = controller,
        _focusNode = focusNode,
        _nextFocusNode = nextFocusNode;

  final TextEditingController? _controller;
  final FocusNode? _focusNode;
  final FocusNode? _nextFocusNode;
  final Function(String value)? onChanged;
  final Function(String value)? validator;
  final String label;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 12,
      maxLength: maxLength,
      controller: _controller,
      focusNode: _focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (term) {
        FocusScope.of(context).requestFocus(_nextFocusNode);
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 10, 44, 169)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromARGB(255, 31, 68, 202)),
        ),
        labelText: label,
        floatingLabelStyle: const TextTheme()
            .labelLarge
            ?.copyWith(color: const Color.fromARGB(255, 88, 131, 248)),
        labelStyle: const TextTheme().labelSmall?.copyWith(
            color: const Color.fromARGB(255, 0, 66, 248).withOpacity(0.7),
            fontSize: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      validator: (String? value) {
        return validator?.call(value ?? '');
      },
      onChanged: (String value) {
        onChanged?.call(value);
      },
    );
  }
}
