

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/basics/asset_player_widget.dart';
import '../widgets/basics/file_player_widget.dart';
import '../widgets/basics/network_player_widget.dart';
import '../widgets/others/tap_bar_widget.dart';

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
    tabs: [
      Tab(icon: Icon(Icons.file_copy), text: 'Asset'),
      Tab(icon: Icon(Icons.attach_file), text: 'File'),
      Tab(icon: Icon(Icons.ondemand_video_outlined), text: 'Network'),
    ],
    onTap: (int value) {  },
    children: [
      buildAssets(),
      buildFiles(),
      buildNetwork(),
    ],
  );

  Widget buildAssets() => AssetPlayerWidget();

  Widget buildFiles() => FilePlayerWidget();

  Widget buildNetwork() => NetworkPlayerWidget();
}