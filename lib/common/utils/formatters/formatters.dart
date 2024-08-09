import 'package:intl/intl.dart';

class CAppFormatters{
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }
}