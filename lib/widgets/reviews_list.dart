import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/widgets/review_card.dart';

class ReviewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageState>(
      builder: (context, pageState, child) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: pageState.reviews.length,
          itemBuilder: (_, index) {
            return ReviewCard(pageState.reviews[index]);
          },
        );
      },
    );
  }
}
