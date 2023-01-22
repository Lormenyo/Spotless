import 'package:flutter/material.dart';
import 'package:spotless/data/models/music.dart';
import 'package:spotless/ui/theme/app_assets.dart';

class SquareMusicCard extends StatelessWidget {
  // art_url, title, artist, genre
  final Music music;
  const SquareMusicCard({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: 150,
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(kCoverArt), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
          ),
          Container()
        ],
      ),
    );
  }
}

class RectangularMusicCard extends StatelessWidget {
  // art_url, title, artist, genre
  final Music music;
  const RectangularMusicCard({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 100,
      child: ListTile(
        leading: const CircleAvatar(),
        title: Text(music.artistName),
        subtitle: Text(music.title),
      ),
    );
  }
}
