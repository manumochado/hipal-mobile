// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class DateTimeHelper {
  static String ddMMyyy(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static String yyyyMMdd(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String hm(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  static String month(DateTime date) {
    return DateFormat('MM').format(date);
  }

  static String yyyyMMddTT(DateTime date) {
    return DateFormat('yyyy-MM-dd h:mm').format(date);
  }

  static String MMMddyyyyTT(DateTime date) {
    return DateFormat('MMM dd, yyyy h:mm a').format(date);
  }

  static String ddMMyyyyTT(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(date);
  }

  static String timeAgo(String language, DateTime date) {
    DateTime currentDate = DateTime.now();
    var different = currentDate.difference(date);

    List<String> es = const [
      'Hace',
      'año',
      'años',
      'mes',
      'meses',
      'semana',
      'semanas',
      'día',
      'días',
      'hora',
      'horas',
      'minuto',
      'minutos',
      'Hace un momento'
    ];
    List<String> en = const [
      'ago',
      'year',
      'years',
      'month',
      'months',
      'week',
      'weeks',
      'day',
      'days',
      'hour',
      'hours',
      'minute',
      'minutes',
      'Just Now'
    ];

    int year = (different.inDays / 365).floor();
    int month = (different.inDays / 30).floor();
    int week = (different.inDays / 7).floor();
    int day = different.inDays;
    int hour = different.inHours;
    int minute = different.inMinutes;

    if (day > 365) {
      return language == 'es'
          ? '${es[0]} $year ${year == 1 ? es[1] : es[2]}'
          : '$year ${year == 1 ? en[1] : en[2]} ${en[0]}';
    }
    if (day > 30) {
      return language == 'es'
          ? '${es[0]} $month ${month == 1 ? es[3] : es[4]}'
          : '$month ${month == 1 ? en[3] : en[4]} ${en[0]}';
    }
    if (day > 7) {
      return language == 'es'
          ? '${es[0]} $week ${week == 1 ? es[5] : es[6]}'
          : '$week ${week == 1 ? en[5] : en[6]} ${en[0]}';
    }
    if (day > 0) {
      return language == 'es'
          ? '${es[0]} $day ${day == 1 ? es[7] : es[8]}'
          : '$day ${day == 1 ? en[7] : en[8]} ${en[0]}';
    }
    if (hour > 0) {
      return language == 'es'
          ? '${es[0]} $hour ${hour == 1 ? es[9] : es[10]}'
          : '$hour ${hour == 1 ? en[9] : en[10]} ${en[0]}';
    }
    if (minute > 0) {
      return language == 'es'
          ? '${es[0]} $minute ${minute == 1 ? es[11] : es[12]}'
          : '$minute ${minute == 1 ? en[11] : en[12]} ${en[0]}';
    }
    if (minute == 0) {
      return language == 'es' ? es[13] : en[13];
    }

    return date.toString();
  }
}

bool disableModules(String view, List<String> modules) =>
    modules.any((m) => m == view);
