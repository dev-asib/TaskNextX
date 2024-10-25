import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(String? date, {String outputFormat = 'MMM d, y'}) {
    if (date != null && date.isNotEmpty) {
      try {
        DateTime parseDate = DateTime.parse(date);
        return DateFormat(outputFormat).format(parseDate);
      } catch (e) {
        return 'Invalid date format.';
      }
    }
    return '';
  }
}
