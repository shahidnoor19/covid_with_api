import 'package:flutter/cupertino.dart';

class MultipleProviderExample extends ChangeNotifier {
  double _value = 1.0;
  double get value => _value;
  void chageValue(double val) {
    _value = val;
    notifyListeners();
  }
}
