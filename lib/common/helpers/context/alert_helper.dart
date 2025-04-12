import 'package:flutter/material.dart';

enum AlertType { success, error, warning, info }

extension _AlertTypeExtension on AlertType {
  Color get backgroundColor {
    switch (this) {
      case AlertType.success:
        return const Color(0xFFDFF5E3);
      case AlertType.error:
        return const Color(0xFFFFE3E3);
      case AlertType.warning:
        return const Color(0xFFFFF7D6);
      case AlertType.info:
        return const Color(0xFFE3F1FF);
    }
  }

  Color get textColor {
    switch (this) {
      case AlertType.success:
        return const Color(0xFF2E7D32);
      case AlertType.error:
        return const Color(0xFFFA4224);
      case AlertType.warning:
        return const Color(0xFFED6C02);
      case AlertType.info:
        return const Color(0xFF0288D1);
    }
  }

  IconData get icon {
    switch (this) {
      case AlertType.success:
        return Icons.check_circle_outline;
      case AlertType.error:
        return Icons.error;
      case AlertType.warning:
        return Icons.warning_amber_outlined;
      case AlertType.info:
        return Icons.info_outline;
    }
  }

  String get defaultTitle {
    switch (this) {
      case AlertType.success:
        return 'Success';
      case AlertType.error:
        return 'Error';
      case AlertType.warning:
        return 'Warning';
      case AlertType.info:
        return 'Info';
    }
  }
}

class AlertHelper {
  const AlertHelper._();

  static void showSnackBar(
    BuildContext context, {
    required String message,
    String? title,
    AlertType type = AlertType.info,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: _buildContent(type, title ?? type.defaultTitle, message),
        ),
      );
  }

  static Widget _buildContent(AlertType type, String title, String message) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(type.icon, color: type.textColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: type.textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(fontSize: 13, color: Color(0xFF1E1D1D)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
