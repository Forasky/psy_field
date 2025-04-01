import 'package:flutter/material.dart';
import 'package:psy_field/screens/get_order_screen.dart';
import 'package:psy_field/screens/main_screen.dart';

void main() {
  runApp(const MainApp());  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetOrderScreen()
    );
  }
}
