import 'package:flutter/material.dart';
import 'package:myapp/login.dart';
import 'package:myapp/register.dart';
import 'package:myapp/home.dart';
import 'package:myapp/emergency_sos.dart';
import 'package:myapp/search.dart';
import 'package:myapp/services.dart';
import 'package:myapp/about.dart';
import 'package:myapp/profile.dart';
import 'package:myapp/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'home': (context) => const HomePage(),
        'emergency': (context) => const EmergencySOSPage(),
        'search': (context) => const SearchPage(),
        'services': (context) => const ServicesPage(),
        'about': (context) => const AboutPage(),
        'profile': (context) => const ProfilePage(),
        'settings': (context) => const SettingsPage(),
      },
    );
  }
}
