import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/theme/main_theme.dart';
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
      theme: mainTheme,
    );
  }
}
