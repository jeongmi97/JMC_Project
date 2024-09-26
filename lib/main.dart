import 'package:flutter/material.dart';
import 'package:jmc/screens/home_screen.dart';
import 'package:jmc/screens/login_screen.dart';
import 'package:jmc/screens/menu_screen.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        // canvasColor: const Color(0xffFE6B00),
        primaryColor: const Color(0xffFE6B00),
        primarySwatch: ColorService.createMaterialColor(
          const Color(0xffFE6B00),
        ),
        cardColor: const Color(0xff007AFF),
        textTheme: const TextTheme(
          displayLarge: TextStyle(),
          displayMedium: TextStyle(
            fontSize: 36,
            letterSpacing: 0.5,
            height: 1.2,
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
          displaySmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
          headlineLarge: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.9),
            fontSize: 30,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0.5,
            height: 1.2,
            shadows: [
              Shadow(
                blurRadius: 1,
                color: Color.fromRGBO(0, 0, 0, 0.2),
                offset: Offset(0, 4),
              ),
            ],
          ),
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          bodyMedium: TextStyle(
            color: Color(0xff4F4F4F),
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 15,
            // letterSpacing: 0.5,
            height: 1.2,
          ),
          labelLarge: TextStyle(
            color: Colors.black,
          ),
          labelMedium: TextStyle(
            color: Color(0xff4F4F4F),
          ),
        ),
      ),
      // initialRoute: '/title',
      routes: {
        '/title': (context) => const TitleScreen(),
        '/home': (context) => const HomeScreen(),
        '/permission': (context) => const PermissionScreen(),
        '/login': (context) => const LoginScreen(),
        '/menu': (context) => const MenuScreen(),
      },
      // home: const TitleScreen(),
      home: const HomeScreen(),
    );
  }
}
