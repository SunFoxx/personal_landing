import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sunfoxx_landing/state/model/review.dart';

enum Role {
  NONE,
  DEVELOPER,
  MUSICIAN,
}

class PageState with ChangeNotifier {
  List<Review> reviews;
  Role role = Role.NONE;
  ScrollController _pageScroll;

  set pageScroll(ScrollController value) {
    _pageScroll = value;
  }

  PageState() {
    reviews = [
      Review(
        rating: 0.9,
        review: "Proven to be responsible and initiative. No "
            "disadvantages found, except of lacking ability live up "
            "to great expectations",
        author: "My mom",
      ),
      Review(
        rating: 0.2,
        reversed: true,
        review: "Who the f*#k is that???",
        author: "Elon Musk",
      ),
    ];
  }

  void setRole(Role value) {
    Role previousValue = role;
    role = value;
    if (value != Role.NONE &&
        previousValue == Role.NONE &&
        _pageScroll != null) {
      _pageScroll.animateTo(
        _pageScroll.offset + 300,
        duration: Duration(milliseconds: 750),
        curve: Curves.easeOut,
      );
    }
    notifyListeners();
  }
}
