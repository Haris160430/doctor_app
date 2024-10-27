import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late CachedVideoPlayerPlusController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerPlusController.networkUrl(
      Uri.parse(
        'https://drive.google.com/file/d/147zWsacWj4GPrdtGfg7JTwvCw8BAli-e/view?usp=sharing',
      ),
      invalidateCacheIfOlderThan: const Duration(days: 30),
    )..initialize().then((_) {
      setState(() {
        _controller.play();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return

      Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: CachedVideoPlayerPlus(_controller),
        )
            : const CircularProgressIndicator(),
      );
  }
}
