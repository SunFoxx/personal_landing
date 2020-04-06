import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sunfoxx_landing/state/controller/page_state_controller.dart';
import 'package:sunfoxx_landing/state/model/review.dart';

import 'model/skill.dart';

enum Role {
  NONE,
  DEVELOPER,
  MUSICIAN,
}

class PageState with ChangeNotifier {
  List<Review> reviews;
  List<Skill> skills;
  Role role = Role.NONE;
  ScrollController _pageScroll;
  PageStateController _controller;

  set pageScroll(ScrollController value) {
    _pageScroll = value;
  }

  PageState() {
    _controller = PageStateController(this);
    _controller.fetchSkills();
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
