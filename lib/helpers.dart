import 'package:intl/intl.dart';

String getFormattedDate(num date, String format) => DateFormat(format)
    .format(DateTime.fromMillisecondsSinceEpoch(date.toInt() * 1000));
