import 'package:flutter/material.dart';

class ShiftProvider extends ChangeNotifier {
  final List<String> _shifts = [
    'Morning Shift',
    'Afternoon Shift',
    'Night Shift',
  ];

  String? _currentShift;

  List<String> get shifts => _shifts;
  String? get currentShift => _currentShift;

  void selectShift(String shift) {
    _currentShift = shift;
    notifyListeners();
  }
}
