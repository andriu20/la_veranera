import 'package:intl/intl.dart';

class FormatoMonedaUtil {
  static final NumberFormat _copFormat = NumberFormat.currency(
    locale: 'es_CO',
    symbol: '',
    decimalDigits: 0, 
  );

  static String formatear(int valor) {
    return _copFormat.format(valor);
  }

  /// Alternativa si deseas usar double
  static String formatearDouble(double valor) {
    return _copFormat.format(valor);
  }
}
