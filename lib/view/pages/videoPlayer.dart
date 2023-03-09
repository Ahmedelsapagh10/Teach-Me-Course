import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {
  final String Url;
  int courseName;
  VideoPlayer({required this.Url, required this.courseName, super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  void _onVideoEnd() {
    widget.courseName++;
  }

  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController _controller;
  late String id;
  @override
  void initState() {
    id = YoutubePlayer.convertUrlToId(
      widget.Url,
    )!;
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    youtubePlayer = YoutubePlayer(
      controller: _controller,
      aspectRatio: 16 / 9,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: YoutubePlayerBuilder(
              player: youtubePlayer,
              builder: (context, videoPlayer) {
                return Container(
                  child: videoPlayer,
                );
              }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
