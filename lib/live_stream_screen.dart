import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});

  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  late VlcPlayerController _vlcPlayerController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  @override
  void dispose() {
    _vlcPlayerController.dispose();
    _vlcPlayerController.stopRendererScanning();
    super.dispose();
  }

  void _initializePlayer() {
    try {
      _vlcPlayerController = VlcPlayerController.network(
        "http://195.196.36.242/mjpg/video.mjpg",
        hwAcc: HwAcc.full,
        autoPlay: true,
        options: VlcPlayerOptions(),
      );
    } catch (e) {
      // Handle initialization error, for example, show an error message
      print("Error initializing VLC player: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InteractiveViewer(
            scaleEnabled: true,
            maxScale: 5,
            minScale: 0.1,
            child: VlcPlayer(
              controller: _vlcPlayerController,
              aspectRatio: 16 / 9,
              placeholder: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
