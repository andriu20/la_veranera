class DateFormatter {
  /// Retorna una fecha en formato YYYY-MM-DD con ceros a la izquierda si es necesario.
  static String formatDate(DateTime fecha) {
    final year = fecha.year;
    final month = fecha.month.toString().padLeft(2, '0');
    final day = fecha.day.toString().padLeft(2, '0');
    return "$year-$month-$day";
  }

  /// Retorna fecha y hora en formato completo: YYYY-MM-DD HH:MM:SS
  static String formatDateTime(DateTime fecha) {
    final date = formatDate(fecha);
    final hour = fecha.hour.toString().padLeft(2, '0');
    final minute = fecha.minute.toString().padLeft(2, '0');
    final second = fecha.second.toString().padLeft(2, '0');
    return "$date $hour:$minute:$second";
  }
}
