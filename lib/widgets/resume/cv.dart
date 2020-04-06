import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/resume/skill_grid.dart';

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
          margin: EdgeInsets.only(top: 50),
          constraints: BoxConstraints(maxWidth: Metrics.DESKTOP_MAXIMUM_SIZE),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile
                ? Metrics.HORIZONTAL_MARGIN_MOBILE
                : Metrics.HORIZONTAL_MARGIN_DESKTOP,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Next infographic reflects my personal level of confidence in using a particular tool or practices. '
                  'The actual proficiency level may vary. I divided all skills into two groups - Primary are skills '
                  'that can be self-sufficient to determine me as a specialist, while Secondary are for those '
                  'that may not be sustainable on their own, but being a vital addition to skills from the first column',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.grey[900].withOpacity(0.8)),
                ),
              ),
              SkillGrid(),
            ],
          ),
        );
      },
    );
  }
}
