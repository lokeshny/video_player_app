import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/orinatation/landscape_player_page.dart';
import '../widgets/orinatation/portrait_player_widget.dart';
import '../widgets/orinatation/potraite_landscape_player_page.dart';
import '../widgets/others/tap_bar_widget.dart';

class OrientationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
    onTap: (index) {
      switch (index) {
        case 1:
          goToLandscape(context);
          break;
        case 2:
          goToPortraitAndLandscape(context);
          break;
      }
    },
    tabs: [
      Tab(icon: Icon(Icons.screen_lock_portrait), text: 'Portrait'),
      Tab(icon: Icon(Icons.screen_lock_landscape), text: 'Landscape'),
      Tab(icon: Icon(Icons.screen_rotation), text: 'Both'),
    ],
    key: null,
    children: [
      buildPortrait(),
      buildLandscape(context),
      buildPortraitAndLandscape(context),
    ],
  );

  Widget buildPortrait() => PortraitPlayerWidget();

  Widget buildLandscape(BuildContext context) => buildButton(
    text: 'Back To Landscape',
    onClicked: () => goToLandscape(context),
  );

  Widget buildPortraitAndLandscape(BuildContext context) => buildButton(
    text: 'Back To Both',
    onClicked: () => goToPortraitAndLandscape(context),
  );

  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      Center(
        child: TextButton(
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
          onPressed: onClicked,
        ),
      );

  void goToLandscape(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LandscapePlayerPage()));

  void goToPortraitAndLandscape(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PortraitLandscapePlayerPage()));
}