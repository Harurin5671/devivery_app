/// Devuelve “Buenos días”, “Buenas tardes” o “Buenas noches”
/// según la hora del `DateTime` recibido.
///
/// Rangos por defecto:
///   • 05:00 – 11:59  →  Buenos días
///   • 12:00 – 17:59  →  Buenas tardes
///   • 18:00 – 04:59  →  Buenas noches
String greetingFor(DateTime dateTime) {
  final h = dateTime.hour;
  if (h >= 5 && h < 12) return 'Good Morning!';
  if (h >= 12 && h < 18) return 'Good Afternoon!';
  return 'Good Evening!';
}
