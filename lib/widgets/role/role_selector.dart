import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/theme/main_theme.dart';
import 'package:sunfoxx_landing/utils/constants.dart';
import 'package:sunfoxx_landing/widgets/role/developer_details.dart';
import 'package:sunfoxx_landing/widgets/role/role_card.dart';

class RoleSelector extends StatefulWidget {
  @override
  _RoleSelectorState createState() => _RoleSelectorState();
}

class _RoleSelectorState extends State<RoleSelector> {
  @override
  void initState() {
    super.initState();
    precacheImage(AssetImage('assets/images/dev.jpg'), context);
    precacheImage(AssetImage('assets/images/music.jpg'), context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageState>(
      builder: (_, pageState, child) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: LayoutBuilder(
            builder: (_, constraints) {
              bool isMobile = MediaQuery.of(context).size.width <=
                  Metrics.MOBILE_DEVICE_SIZE;
              double spacerSize = isMobile ? 15 : 30;
              double paddingSize = isMobile
                  ? Metrics.HORIZONTAL_MARGIN_MOBILE
                  : Metrics.HORIZONTAL_MARGIN_DESKTOP;
              double availableSize =
                  constraints.maxWidth - spacerSize - (paddingSize * 2);
              double equalSize = availableSize / 2;
              double expandedSize = availableSize / 4 * 3;
              double shrinkSize = availableSize / 4;

              double getRoleSize(Role role) {
                if (pageState.role == Role.NONE) {
                  return equalSize;
                }

                return pageState.role == role ? expandedSize : shrinkSize;
              }

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: paddingSize,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.easeInOutCirc,
                      width: getRoleSize(Role.DEVELOPER),
                      alignment: Alignment.center,
                      child: RoleCard(
                        role: Role.DEVELOPER,
                        roleName: 'Developer',
                        roleEmoji: '👨‍💻',
                        color: AppColors.roleCard1,
                        expandedContent: DeveloperDetails(),
                      ),
                    ),
                    SizedBox(width: spacerSize),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 750),
                      alignment: Alignment.center,
                      curve: Curves.easeInOutCirc,
                      width: getRoleSize(Role.MUSICIAN),
                      child: RoleCard(
                        role: Role.MUSICIAN,
                        roleName: 'Musician',
                        roleEmoji: '🎧‍',
                        color: AppColors.roleCard2,
                        expandedContent: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/music.jpg'),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.grey[800].withOpacity(0.7),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
