import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../others/video_player_widget.dart';

class AssetPlayerWidget extends StatefulWidget {
  @override
  _AssetPlayerWidgetState createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  final  asset = 'assets/file_example_MP4_1280_10MG.mp4';
   VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    print(11111111111111111);
    controller = VideoPlayerController.asset('assets/file_example_MP4_1280_10MG.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..initialize().then((_) => controller!.play());
    print(2222222222222);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller?.value.volume == 0;

    return Column(
      children: [
        VideoPlayerWidget(controller: controller!, key: null,),
        const SizedBox(height: 32),
        if (controller != null && controller!.value.isInitialized)
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: IconButton(
              icon: Icon(
                isMuted ? Icons.volume_mute : Icons.volume_up,
                color: Colors.white,
              ),
              onPressed: () => controller!.setVolume(isMuted ? 1 : 0),
            ),
          )
      ],
    );
  }
}