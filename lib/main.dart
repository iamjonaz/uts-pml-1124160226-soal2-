import 'package:flutter/material.dart';

import 'screens/login_page.dart';
import 'screens/profile_page.dart';
import 'screens/about_page.dart';
import 'theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF8B0000);

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'Profil Mahasiswa',
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor,
            ),
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor,
              brightness: Brightness.dark,
            ),
          ),

          themeMode: currentMode,

          initialRoute: '/login',

          routes: {
            '/login': (context) => const LoginPage(),
            '/profile': (context) => const ProfilePage(),
            '/about': (context) => const AboutPage(),
          },
        );
      },
    );
  }
}