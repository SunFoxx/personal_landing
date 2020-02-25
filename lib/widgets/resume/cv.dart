import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/resume/skill_card.dart';

class Resume extends StatefulWidget {
  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    bool isMobile =
        MediaQuery.of(context).size.width <= Metrics.MOBILE_DEVICE_SIZE;
    return Consumer<PageState>(
      builder: (context, state, child) {
        return Container(
          margin: EdgeInsets.only(top: 30),
          // constraints: BoxConstraints(minHeight: 200),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile
                ? Metrics.HORIZONTAL_MARGIN_MOBILE
                : Metrics.HORIZONTAL_MARGIN_DESKTOP,
          ),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'Skills',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 32.0, shadows: [
                      Shadow(
                        color: Colors.black45.withOpacity(0.6),
                        blurRadius: 4.0,
                        offset: Offset(1.0, 1.0),
                      )
                    ]),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minHeight: 100,
                  maxHeight: double.infinity,
                ),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  childAspectRatio: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 10.0,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: false,
                  crossAxisCount: isMobile ? 2 : 3,
                  children: state.skills
                      .asMap()
                      .map((i, e) => MapEntry(
                          i,
                          FittedBox(
                            child: SkillCard(e),
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.lerp(
                              Alignment.centerLeft,
                              Alignment.centerRight,
                              i % 3 / 2,
                            ),
                          )))
                      .values
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
