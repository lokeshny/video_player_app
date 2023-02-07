import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/lib/widgets/orinatation/videoplayer_fullscreen_widget.dart';

import '../../../main.dart';

class PortraitPlayerWidget extends StatefulWidget {
  @override
  _PortraitPlayerWidgetState createState() => _PortraitPlayerWidgetState();
}

class _PortraitPlayerWidgetState extends State<PortraitPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.network(urlPortraitVideo)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      VideoPlayerFullscreenWidget(controller: controller);
}