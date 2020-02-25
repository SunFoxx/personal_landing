import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunfoxx_landing/state/page_state.dart';
import 'package:sunfoxx_landing/widgets/base/screen.dart';
import 'package:sunfoxx_landing/widgets/details_slider.dart';
import 'package:sunfoxx_landing/widgets/header.dart';
import 'package:sunfoxx_landing/widgets/role/role_selector.dart';
import 'package:sunfoxx_landing/widgets/welcome_instructions.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    Provider.of<PageState>(context).pageScroll = null;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PageState>(context).pageScroll = _scrollController;

    return Screen(
      children: <Widget>[
        Header(),
        WelcomeInstructions(),
        RoleSelector(),
        DetailsSlider(),
      ],
      scrollController: _scrollController,
    );
  }
}
