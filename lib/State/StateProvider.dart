import 'package:flutter/material.dart';

class StateProvider with ChangeNotifier {
  int _currentStatus = 0;

  int get currentStatus => _currentStatus;

  void changeStatus(int status) {
    _currentStatus = status;
    notifyListeners();
  }
}