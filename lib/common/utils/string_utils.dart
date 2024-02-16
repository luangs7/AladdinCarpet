import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  var formatCurrency = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
  );

  return formatCurrency.format(amount);
}

String toDimensions(double side1, double? side2) {
  if ((side2 ?? 0) == 0.0) {
    return "${side1.toString()} m2";
  }
  return "${side1.toString()}x${side2.toString()} m2";
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
