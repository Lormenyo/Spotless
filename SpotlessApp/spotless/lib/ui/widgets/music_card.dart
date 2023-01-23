import 'package:flutter/material.dart';
import 'package:spotless/data/models/music.dart';
import 'package:spotless/ui/theme/app_assets.dart';
import 'package:spotless/ui/theme/app_colors.dart';

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
          Positioned(
            bottom: 0,
            left: 5,
            right: 5,
            child: Container(
              height: 70,
              width: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
            ),
          )
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
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 65,
      width: 179,
      child: ListTile(
        tileColor: AppColors.spotlessPurple3,
        leading: CircleAvatar(
          child: Image.asset(music.artistImage),
        ),
        title: Text(music.artistName),
        subtitle: Text(music.title),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
    );
  }
}
