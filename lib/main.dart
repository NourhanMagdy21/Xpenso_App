import 'package:flutter/material.dart';
import 'package:xpenso_app/features/home/expenses.dart';

void main() {
  runApp(const MyApp());
}

var myColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));
var myDarkColorScheme =
ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData().copyWith(
          colorScheme: myColorScheme,
          appBarTheme: AppBarTheme().copyWith(
              backgroundColor: myColorScheme.onPrimaryContainer,
              foregroundColor: myColorScheme.primaryContainer),
          cardTheme: CardTheme().copyWith(
              color: myColorScheme.secondaryContainer,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myColorScheme.primaryContainer)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: myColorScheme.onSecondaryContainer,
                  fontSize: 20),
          ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: myDarkColorScheme,
        bottomSheetTheme: BottomSheetThemeData().copyWith(
          backgroundColor: myDarkColorScheme.onPrimaryContainer,
        ),
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: myDarkColorScheme.onPrimaryContainer,
            foregroundColor: myDarkColorScheme.primaryContainer),
        cardTheme: CardTheme().copyWith(
            color: myDarkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: myDarkColorScheme.primaryContainer,
              foregroundColor: myDarkColorScheme.onPrimaryContainer,)),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: myDarkColorScheme.onSecondaryContainer,
              fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(),
    );
  }
}
