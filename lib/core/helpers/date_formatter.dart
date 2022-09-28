import 'package:intl/intl.dart';

class CustomDateFormatter {
  static String userScoreDateFormatter(String scoreDate) {
    final date = DateTime.parse(scoreDate);
    String formattedDate = DateFormat.yMd().format(date);
    String formattedTime = DateFormat.jm().format(date);
    return "$formattedDate ($formattedTime)";
  }
}
