import 'package:flutter/material.dart';
import 'package:shiftmate/providers/auth_provider.dart';
import 'package:shiftmate/providers/shift_provider.dart';
import 'package:shiftmate/root_router.dart';
import 'package:provider/provider.dart';


void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ShiftProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RootRouter(),
      ),
    );
  }

}