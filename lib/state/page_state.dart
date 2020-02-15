import 'package:flutter/foundation.dart';
import 'package:sunfoxx_landing/state/model/review.dart';

class PageState with ChangeNotifier {
  List<Review> reviews;

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
}
