class FormatDate {

  static List<String> months = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre'
  ];

  static List<String> days = [
    'Lunes',
    'Martes',
    'Miercoles',
    'Jueves',
    'Viernes',
    'Sabado',
    'Domingo'
  ];

  static String formatDate(DateTime date) {
    int index = date.month - 1;
    String day = date.day.toString();
    day = int.parse(day) < 10 ? '0$day' : day;
    String hour = date.hour.toString();
    String minute = date.minute.toString();
    if(int.parse(minute) < 10) {
      minute = '0$minute';
    }
    if(int.parse(hour) > 12) {
      hour = '${int.parse(hour) - 12}';
      minute = '$minute pm';
    }else{
      if(int.parse(hour) == 0) {
        hour = '12';
        minute = '$minute pm';
      }else{
        minute = '$minute am';
      }
      
    }
    int nameDay = date.weekday;
    return '${months[index]} $day, ${days[nameDay]} - ${hour}:${minute}';
  }
}