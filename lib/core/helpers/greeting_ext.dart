import 'package:flutter/widgets.dart';

import 'greeting.dart';

extension GreetingX on BuildContext {
  /// Saludo instantáneo basado en la hora local del dispositivo.
  String get greetingNow => greetingFor(DateTime.now());
}
