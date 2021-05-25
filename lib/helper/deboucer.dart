import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer extends ChangeNotifier {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({ this.milliseconds });

  run(Function action) {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), () async {
      
    });
  }
}