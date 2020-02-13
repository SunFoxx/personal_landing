import 'package:flutter/material.dart';
import 'package:sunfoxx_landing/widgets/navbar.dart';
import 'package:sunfoxx_landing/widgets/review_card.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
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
    );
  }
}
