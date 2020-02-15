import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/navbar.dart';
import 'package:sunfoxx_landing/widgets/reviews_list.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: Metrics.MINIMAL_SCREEN_WIDTH,
            maxWidth: Math.max(Metrics.MINIMAL_SCREEN_WIDTH, screenWidth),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
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
                  child: SingleChildScrollView(
                    primary: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Navbar(),
                        ReviewsList(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
