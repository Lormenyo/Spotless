import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotless/data/models/music.dart';
import 'package:spotless/ui/theme/app_colors.dart';
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
      appBar: buildNowPlayingAppbar(),
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

  buildNowPlayingAppbar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: const CircleAvatar(
            backgroundColor: AppColors.spotlessPurple3,
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      title: Text(
        'Now Playing',
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(color: Colors.black, fontSize: 25),
      ),
      backgroundColor: Colors.white,
    );
  }
}
