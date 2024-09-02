import 'package:flutter/material.dart';
import 'package:jmc/screens/home_screen.dart';
import 'package:jmc/screens/permission_screen.dart';
import 'package:jmc/screens/title_screen.dart';
import 'package:jmc/services/color_service';

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
        useMaterial3: false,
        // canvasColor: const Color(0xffFE6B00),
        primaryColor: const Color(0xffFE6B00),
        primarySwatch: ColorService.createMaterialColor(
          const Color(0xffFE6B00),
        ),
        cardColor: const Color(0xff007AFF),
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
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          labelMedium: TextStyle(
            color: Color(0xff4F4F4F),
          ),
        ),
      ),
      initialRoute: '/title',
      routes: {
        '/title': (context) => const TitleScreen(),
        '/home': (context) => const HomeScreen(),
        '/permission': (context) => const PermissionScreen(),
      },
      home: const TitleScreen(),
    );
  }
}
