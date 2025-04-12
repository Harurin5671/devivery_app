import 'package:flutter/material.dart';

import 'package:delivery/core/core.dart';

class Greeting extends StatelessWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Hey User, ',
            style: TextStyle(fontSize: 16, color: Color(0xFF1E1D1D)),
          ),
          TextSpan(
            text: context.greetingNow,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1E1D1D),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}