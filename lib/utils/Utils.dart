import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  final formatter = DateFormat('EEE MM/dd/yyyy');
  return formatter.format(date);
}