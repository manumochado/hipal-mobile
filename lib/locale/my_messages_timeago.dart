import 'package:timeago/timeago.dart';

class MyMessagesTimeAgo implements LookupMessages {
  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => 'ahora';
  @override String aboutAMinute(int minutes) => '${minutes} minuto';
  @override String minutes(int minutes) => '${minutes} min';
  @override String aboutAnHour(int minutes) => (minutes > 60) ? '1 hora' : '${minutes} min';
  @override String hours(int hours) => '${hours} horas';
  @override String aDay(int hours) => '${hours} horas';
  @override String days(int days) => '${days} días';
  @override String aboutAMonth(int days) => '${days} día';
  @override String months(int months) => '${months} meses';
  @override String aboutAYear(int year) => '${year} año';
  @override String years(int years) => '${years} años';
  @override String wordSeparator() => ' ';
}