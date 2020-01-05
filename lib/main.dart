import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/screens/landing_page.dart';

void main() => runApp(LandingApp());

class LandingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        accentColor: Color(0xffff4d00),
        primaryColor: Color(0xff243B55),
        primaryColorDark: Color(0xff141E30),
        scaffoldBackgroundColor: Colors.transparent,
        textTheme: TextTheme(
          body1: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
          subhead: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
