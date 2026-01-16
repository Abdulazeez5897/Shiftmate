import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shiftmate/providers/shift_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? _currentShift; // ✅ state lives here

  @override
  Widget build(BuildContext context) {
    final shiftProvider = context.watch<ShiftProvider>(); // ✅ context is valid here

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
        children: [
          DropdownButton<String>(
            value: shiftProvider.currentShift,
            hint: const Text('Select a shift'),
            items: shiftProvider.shifts
                .map(
                  (shift) => DropdownMenuItem(
                value: shift,
                child: Text(shift),
              ),
            )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                shiftProvider.selectShift(value);
              }
            },
          ),
          if (shiftProvider.currentShift != null)
            Text(
              'Selected: ${shiftProvider.currentShift}',
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }
}
