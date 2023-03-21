import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerExample extends StatefulWidget {
  const YoutubePlayerExample({Key? key}) : super(key: key);

  @override
  State<YoutubePlayerExample> createState() => _YoutubePlayerExampleState();
}

class _YoutubePlayerExampleState extends State<YoutubePlayerExample> {
  final video = "https://www.youtube.com/watch?v=glDU96h8A48";

  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(video);

    _controller = YoutubePlayerController(
      initialVideoId: "https://www.youtube.com/watch?v=glDU96h8A48",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller!,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Youtube Player"),
          ),
          body: player,
        );
      },
    );
  }
}
