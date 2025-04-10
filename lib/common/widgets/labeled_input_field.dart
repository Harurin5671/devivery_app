import 'package:flutter/material.dart';

class LabeledInputField extends StatelessWidget {
  const LabeledInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.type = TextInputType.text,
  });
  final String hintText;
  final String label;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(color: Color(0xFF32343E), fontSize: 13),
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: type,
          obscureText: obscureText,
          obscuringCharacter: '*',
          style: TextStyle(
            color: Color(0xFF32343E),
            fontSize: 14,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF0F5FA),
            hintText: hintText,
            hintStyle: TextStyle(color: Color(0xFFA0A5BA), fontSize: 14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            suffixIcon: suffixIcon,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
