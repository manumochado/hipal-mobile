import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final int milliseconds;
  Timer? timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (timer != null) {
      timer?.cancel();
    } else {
      timer = Timer(Duration(milliseconds: milliseconds), action);
    }
  }
}
