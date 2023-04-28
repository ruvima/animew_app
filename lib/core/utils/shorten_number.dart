import 'package:intl/intl.dart';

String shortenNumber(int number) {
  String shortened = NumberFormat.compact().format(number);

  return shortened;
}
