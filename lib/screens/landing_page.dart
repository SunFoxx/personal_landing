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
              Theme.of(context).primaryColorDark,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Navbar(),
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
