import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/model/skill.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/resume/skill_card.dart';

class SkillGrid extends StatelessWidget {
  Widget _buildGrid(BuildContext context, List<Skill> source) {
    bool isMobile =
        MediaQuery.of(context).size.width <= Metrics.MOBILE_DEVICE_SIZE;

    if (isMobile) {
      return Column(
        children: source
            .map((skill) => FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: SkillCard(skill),
                  ),
                ))
            .toList(),
      );
    }

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 4,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 4.0,
      crossAxisCount: 2,
      children: source
          .asMap()
          .map((i, skill) => MapEntry(
                i,
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SkillCard(skill),
                  alignment: Alignment.lerp(
                    Alignment.centerLeft,
                    Alignment.centerRight,
                    (i % 2) * 1.0,
                  ),
                ),
              ))
          .values
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageState>(
      builder: (context, state, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Column(
                children: <Widget>[
                  Text('Primary'),
                  _buildGrid(
                    context,
                    state.skills
                        .where((element) => element.primary == true)
                        .toList(),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: <Widget>[
                  Text('Secondary'),
                  _buildGrid(
                    context,
                    state.skills
                        .where((element) => element.primary == false)
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
