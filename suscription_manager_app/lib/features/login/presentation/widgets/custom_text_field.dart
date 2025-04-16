import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.onChanged,
    this.isPassword = false,
  });

  final String label;
  final Function(String) onChanged;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
          color: Color.fromARGB(255, 19, 32, 221), fontWeight: FontWeight.bold),
      onChanged: onChanged,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:
              const BorderSide(color: Color.fromARGB(255, 85, 109, 243)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(255, 8, 41, 227)),
        ),
      ),
    );
  }
}
