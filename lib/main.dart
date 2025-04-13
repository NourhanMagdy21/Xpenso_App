import 'package:flutter/material.dart';
import 'package:xpenso_app/features/home/expenses.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(),
    );
  }
}

