import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import './theme/app_theme.dart';

void main() {
  runApp(FootballTicketApp());
}

class FootballTicketApp extends StatelessWidget {
  const FootballTicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Zeq Ticket',
      theme: MyTheme.darkRedTheme.copyWith(
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(username: 'User'),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
