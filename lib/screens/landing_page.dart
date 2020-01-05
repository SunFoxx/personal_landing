import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/widgets/navbar.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff141E30),
              Color(0xff243B55),
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Navbar(),
            Image(
              image: AssetImage('assets/images/me.JPG'),
              height: 400,
              fit: BoxFit.fitWidth,
            ),
            Center(
              child: Text(
                'Text',
                style: Theme.of(context).textTheme.body1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
