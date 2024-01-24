import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  final VlcPlayerController _vlcPlayerController = VlcPlayerController.network(
    //here add your http or rtsp link to stream
      "http://195.196.36.242/mjpg/video.mjpg",
      //http://pendelcam.kip.uni-heidelberg.de/mjpg/video.mjpg

      hwAcc: HwAcc.auto,
      autoPlay: true,
      options: VlcPlayerOptions());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VlcPlayer(
            controller: _vlcPlayerController,
            aspectRatio: 16 / 9,
            placeholder: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
