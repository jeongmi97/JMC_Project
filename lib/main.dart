import 'package:flutter/material.dart';
import 'package:jmc/screens/home_screen.dart';
import 'package:jmc/screens/title_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: const Color(0xffFE6B00),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold),
          displaySmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 1,
                color: Color.fromRGBO(0, 0, 0, 0.2),
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
      ),
      initialRoute: '/title',
      routes: {
        '/title': (context) => const TitleScreen(),
        '/home': (context) => const HomeScreen(),
      },
      home: const TitleScreen(),
    );
  }
}
