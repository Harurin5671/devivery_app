import 'package:flutter/material.dart';

enum AppButtonIconPosition { left, right }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconPosition = AppButtonIconPosition.left,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final AppButtonIconPosition iconPosition;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );

    final iconWidget = icon != null
        ? Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: Color(0xFFff914e),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 18))
        : null;

    final children = <Widget>[
      if (iconWidget != null && iconPosition == AppButtonIconPosition.left)
        iconWidget,
      if (iconWidget != null) const SizedBox(width: 8),
      textWidget,
      if (iconWidget != null && iconPosition == AppButtonIconPosition.right)
        const SizedBox(width: 8),
      if (iconWidget != null && iconPosition == AppButtonIconPosition.right)
        iconWidget,
    ];

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF7622),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 62),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
