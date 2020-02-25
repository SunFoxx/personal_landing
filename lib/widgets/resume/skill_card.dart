import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';
import 'package:sunfoxx_landing/state/model/skill.dart';

class SkillCard extends StatefulWidget {
  final Skill skill;

  SkillCard(this.skill);

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _appearAnimation;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _appearAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.skill.name),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.33) {
          _animationController.forward();
          setState(() {
            isVisible = true;
          });
        }
      },
      child: AnimatedBuilder(
        animation: _appearAnimation,
        builder: (_, child) => Opacity(
          opacity: _appearAnimation.value,
          child: Container(
            width: 300,
            height: 100,
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: <Widget>[
                // long bar
                Container(
                  margin: EdgeInsets.only(left: 85),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).primaryColorDark.withOpacity(0.4),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      // rating bar
                      AnimatedBuilder(
                        animation: _appearAnimation,
                        builder: (_, child) => FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor:
                          (widget.skill.rating * _appearAnimation.value) / 10,
                          heightFactor: 1.0,
                          child: Container(
                            foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0),
                                  Colors.white.withOpacity(0.6),
                                  Colors.white.withOpacity(0),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.05, 0.25, 0.45],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color.lerp(
                                Colors.red,
                                Colors.green,
                                (widget.skill.rating * _appearAnimation.value) /
                                    10,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Tech name
                      Center(
                        child: Text(
                          widget.skill.name,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ),
                // icon ring
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).primaryColorDark.withOpacity(0.5),
                    ),
                    gradient: RadialGradient(
                      center: Alignment(0.75, 0.2),
                      radius: 1,
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white.withOpacity(0),
                      ],
                    ),
                  ),
                  child: Image.network(
                    widget.skill.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
