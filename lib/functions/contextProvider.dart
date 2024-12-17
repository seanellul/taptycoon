import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fm/data/shop_item.dart';

class ContextProvider extends ChangeNotifier {
  int taps = 3000;
  Color color = Colors.blue;
  int colorIndex = 0;
  int multiplier = 1;
  int actualTaps = 0;

  void registerTap() {
    incrementTap();
    changeColor();
  }

  void incrementTap() {
    print(multiplier);
    actualTaps++;
    taps = taps + (1 * multiplier);
    notifyListeners();
  }

  void changeColor() {
    colorIndex = (colorIndex + 1) % Colors.primaries.length;
    color = Colors.primaries[colorIndex];
    notifyListeners();
  }

  void buyItem(ShopItem item) {
    if (item.tapPrice <= taps) {
      taps -= item.tapPrice;
      multiplier = multiplier + item.multiplier;
      notifyListeners();
    }
  }
}
