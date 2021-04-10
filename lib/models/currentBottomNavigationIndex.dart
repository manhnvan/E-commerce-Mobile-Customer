import 'package:flutter/cupertino.dart';

class CurrentBottomNavigation extends ChangeNotifier {
  int index = 0;
  CurrentBottomNavigation(this.index);

  void changeCurrentIndex(int index) {
    this.index = index;
    notifyListeners();
  }

  int getIndex() {
    return this.index;
  }
}