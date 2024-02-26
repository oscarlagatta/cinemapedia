import 'package:intl/intl.dart';

class HumansFormats {

  static String number( double number, [int decimals = 0]) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en'
    ).format(number);

    return formattedNumber;

  }

}