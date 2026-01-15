import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _currentShift = 'Day';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today’s Shift',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            DropdownButton<String>(
              value: _currentShift,
              items: const [
                DropdownMenuItem(value: 'Day', child: Text('Day Shift')),
                DropdownMenuItem(value: 'Night', child: Text('Night Shift')),
                DropdownMenuItem(value: 'Off', child: Text('Day Off')),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _currentShift = value;
                });
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Selected: $_currentShift',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
