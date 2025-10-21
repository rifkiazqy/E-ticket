import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final NumberFormat _rupiahFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static String formatRupiah(double amount) {
    return _rupiahFormat.format(amount);
  }

  static double? parseRupiah(String text) {
    try {
      // Hapus simbol mata uang dan separator ribuan
      final cleanText = text.replaceAll(RegExp(r'[Rp.,\s]'), '');
      return double.parse(cleanText);
    } catch (e) {
      return null;
    }
  }
}