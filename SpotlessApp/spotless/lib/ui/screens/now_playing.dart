import 'package:flutter/material.dart';
import 'package:spotless/data/models/music.dart';
import 'package:spotless/ui/widgets/music_card.dart';

class NowPlaying extends StatefulWidget {
  final Music music;
  const NowPlaying({Key? key, required this.music}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            NowPlayingMusicCard(
              music: widget.music,
            )
          ],
        ),
      ),
    );
  }
}
