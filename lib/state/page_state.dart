import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

  set pageScroll(ScrollController value) {
    _pageScroll = value;
  }

  PageState() {
    skills = [
      Skill(
        name: 'Flutter',
        rating: 7,
        imageUrl: 'https://logodix.com/logo/374736.png',
      ),
      Skill(
        name: 'Java-Script',
        rating: 9,
        imageUrl: 'https://logodix.com/logo/374736.png',
      ),
      Skill(
        name: 'React-Native',
        rating: 9,
        imageUrl: 'https://logodix.com/logo/374736.png',
      ),
      Skill(
        name: 'Dart',
        rating: 7,
        imageUrl: 'https://logodix.com/logo/374736.png',
      ),
      Skill(
        name: 'Vue.js',
        rating: 5,
        imageUrl: 'https://logodix.com/logo/374736.png',
      ),
      Skill(
        name: 'Firebase',
        rating: 8,
        imageUrl: 'https://logodix.com/logo/374736.png',
      ),
    ]..sort((a, b) => b.rating - a.rating);
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
