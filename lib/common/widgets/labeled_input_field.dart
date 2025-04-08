import 'package:flutter/material.dart';

class LabeledInputField extends StatelessWidget {
  const LabeledInputField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.type = TextInputType.text
  });

  final String label;
  final bool obscureText;
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
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFF0F5FA),
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
            suffixIcon:
                obscureText
                    ? const Icon(Icons.visibility_off, color: Color(0xFFA0A5BA))
                    : null,
          ),
        ),
      ],
    );
  }
}
