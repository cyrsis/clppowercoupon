import 'package:intl/intl.dart';

class AppFormat {

  static get MMMddyyyy => DateFormat('MMM dd, yyyy');
  static get simpleFormat =>NumberFormat.simpleCurrency();
}