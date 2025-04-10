import 'package:flutter/material.dart';

enum AppButtonIconPosition { left, right }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.iconPosition = AppButtonIconPosition.left,
    this.backgroundColor,
    this.foregroundColor,
    this.minimumSize,
    this.padding,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final AppButtonIconPosition iconPosition;

  // — Personalización opcional —
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Size? minimumSize;
  final EdgeInsetsGeometry? padding;

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

    final iconWidget = icon == null
        ? null
        : Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFFFF914E),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 18),
          );

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

    final defaultStyle = Theme.of(context).elevatedButtonTheme.style;

    final localStyle = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      minimumSize: minimumSize,
      padding: padding,
    );

    return ElevatedButton(
      onPressed: onPressed,
      style: localStyle.merge(defaultStyle), // ← 1) toma lo que pases; 2) completa con el tema
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
