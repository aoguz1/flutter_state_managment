import 'package:flutter/material.dart';

class Sayac with ChangeNotifier {
  int _sayi;
  Sayac(this._sayi);
  int get sayi => _sayi;

  set sayi(int value) => _sayi = value;

  arttir() {
    _sayi++;
    notifyListeners();
  }

  azalt() {
    _sayi--;
    notifyListeners();
  }
}
