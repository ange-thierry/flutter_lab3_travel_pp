import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wanderlust Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1A3C3E),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF1A3C5E),
          secondary: const Color(0xFF00C9A7),
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFF6F9FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF1A3C5E)),
          titleTextStyle: TextStyle(
            color: Color(0xFF1A3C5E),
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}