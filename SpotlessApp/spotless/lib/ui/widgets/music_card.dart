import 'package:flutter/material.dart';
import 'package:spotless/data/models/music.dart';

class SquareMusicCard extends StatelessWidget {
  // art_url, title, artist, genre
  final Music music;
  const SquareMusicCard({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 100,
      child: Stack(
        children: [Container(), Container()],
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
