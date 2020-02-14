import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/navbar.dart';
import 'package:sunfoxx_landing/widgets/review_card.dart';

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
                      children: <Widget>[
                        Navbar(),
                        ReviewCard(
                          rating: 0.9,
                          review: "Proven to be responsible and initiative. No "
                              "disadvantages found, except of lacking ability live up "
                              "to great expectations",
                          author: "My mom",
                        ),
                        ReviewCard(
                          rating: 0.2,
                          reversed: true,
                          review: "Who the f*#k is that???",
                          author: "Elon Musk",
                        ),
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
