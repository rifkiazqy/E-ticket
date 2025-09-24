import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import './theme/app_theme.dart';

void main() {
  runApp(FootballTicketApp());
}

class FootballTicketApp extends StatelessWidget {
  const FootballTicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Ticket',
  theme: MyTheme.darkRedTheme,
  home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
