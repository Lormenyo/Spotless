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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            NowPlayingMusicCard(
              music: widget.music,
            ),
            buildMusicSeekBar()
          ],
        ),
      ),
    );
  }

  buildNowPlayingAppbar() {
    return AppBar(
      leading: IconButton(
          onPressed: onBackPressed,
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

  onBackPressed() {
    Navigator.of(context).pop();
  }

  buildMusicSeekBar() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.music.title,
            style:
                Theme.of(context).textTheme.headline2?.copyWith(fontSize: 23),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            widget.music.artistName,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontSize: 17, color: AppColors.spotlessGray3),
          )
        ],
      ),
    );
  }
}
