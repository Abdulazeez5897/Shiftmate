import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShiftProvider extends ChangeNotifier {
  final List<String> _shifts = [
    'Morning Shift',
    'Afternoon Shift',
    'Night Shift',
  ];

  String? _currentShift;

  List<String> get shifts => _shifts;
  String? get currentShift => _currentShift;

  ShiftProvider() {
    _loadShift();
  }

  Future<void> _loadShift() async {
    final prefs = await SharedPreferences.getInstance();
    _currentShift = prefs.getString('currentShift');
    notifyListeners();
  }

  Future<void> selectShift(String shift) async {
    _currentShift = shift;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentShift', shift);
    notifyListeners();
  }
}