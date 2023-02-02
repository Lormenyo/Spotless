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
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.spotlessPurple1,
          )),
      title: Text(
        'Now Playing',
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.copyWith(color: AppColors.spotlessPurple1),
      ),
      backgroundColor: Colors.white,
    );
  }
}
