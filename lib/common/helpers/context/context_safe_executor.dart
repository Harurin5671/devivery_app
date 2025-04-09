import 'package:flutter/material.dart';

/// Ejecuta una serie de acciones asincrónicas de forma segura antes de usar [BuildContext].
///
/// - Evita errores al usar context luego de un async gap.
/// - [actions] es una lista de funciones asincrónicas que se ejecutarán en orden.
/// - [onSafeContextUse] se ejecuta solo si el [BuildContext] sigue montado.
Future<void> safelyExecuteWithContext({
  required BuildContext context,
  required List<Future<void> Function()> actions,
  required void Function(BuildContext context) onSafeContextUse,
}) async {
  for (final action in actions) {
    await action();
  }

  if (context.mounted) {
    onSafeContextUse(context);
  }
}
