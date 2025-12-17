import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isPasswordHidden;
  final VoidCallback? onPasswordToggle;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.isPasswordHidden = true,
    this.onPasswordToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? isPasswordHidden : false,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: isPassword
                ? IconButton(
              icon: Icon(
                isPasswordHidden
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
              onPressed: onPasswordToggle,
            )
                : null,
            border: const UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
