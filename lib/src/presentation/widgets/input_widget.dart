import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final bool outlineBorder; // true: outline, false: underline
  final String label;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Function(dynamic e) onChanged;
  final Widget? sufixIcon;
  final bool obscureText;
  final int lines;

  const CustomInput({
    super.key,
    required this.onChanged,
    this.outlineBorder = true,
    this.obscureText = false,
    this.label = '',
    this.controller,
    this.prefixIcon,
    this.sufixIcon,
    this.lines =1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: lines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        border: outlineBorder ? OutlineInputBorder() : UnderlineInputBorder(),
        enabledBorder:
            outlineBorder
                ? OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
                : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
        focusedBorder:
            outlineBorder
                ? OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                )
                : UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
      ),
    );
  }
}
