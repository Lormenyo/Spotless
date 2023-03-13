import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotless/data/models/album.dart';
import 'package:spotless/data/models/genreplaylist.dart';
import 'package:spotless/data/models/music.dart';
import 'package:spotless/helpers/custom_extensions.dart';
import 'package:spotless/ui/screens/album_tracks.dart';
import 'package:spotless/ui/theme/app_assets.dart';
import 'package:spotless/ui/theme/app_colors.dart';

class SquareMusicCard extends StatelessWidget {
  // art_url, title, artist, genre
  final Album music;
  const SquareMusicCard({Key? key, required this.music}) : super(key: key);

  void onSquareMusicCardPressed(Album music, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AlbumTracks(album: this.music)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSquareMusicCardPressed(music, context),
      child: Container(
        height: 145,
        width: 150,
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        music.images == null
                            ? "https://i.pravatar.cc/300"
                            : music.images?[0]["url"],
                      ),
                      fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0))),
            ),
            Positioned(
                bottom: 0.4,
                left: 7,
                // right: 5,
                width: 126,
                height: 53,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.grey.withOpacity(0.28),
                    ),
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 5,
              right: 5,
              child: Container(
                height: 52,
                width: 120,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    gradient: LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: [
                        Color.fromRGBO(
                          255,
                          255,
                          255,
                          0.28,
                        ),
                        Color.fromRGBO(255, 255, 255, 0.62),
                        Color.fromRGBO(255, 255, 255, 1.0)
                      ],
                      stops: [1.0, 0.5, 0.0],
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${music.name}".truncateTo(10),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      "${music.artists?[0]['name']}".truncateTo(11),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RectangularMusicCard extends StatelessWidget {
  // art_url, title, artist, genre
  final Album music;
  const RectangularMusicCard({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> tileColorList = [
      AppColors.spotlessPurple3,
      AppColors.spotlessGreen
    ];
    tileColorList.shuffle();

    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 65,
      width: 179,
      child: ListTile(
        tileColor: tileColorList.first,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(music.images?[0]["url"]),
        ),
        title: Text(
          "${music.artists?[0]['name']}".truncateTo(10),
          style:
              Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 12),
        ),
        subtitle: Row(
          children: [
            SvgPicture.asset(kSmallPurpleMusic),
            const SizedBox(
              width: 5,
            ),
            Text(
              "${music.name}".truncateTo(9),
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.spotlessGray3, fontSize: 10),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
    );
  }
}

class NowPlayingMusicCard extends StatelessWidget {
  final Music music;

  const NowPlayingMusicCard({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 230.0,
        height: 290.0,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: 230,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(music.artUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.transparent, width: 0.0),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(200),
                      topRight: Radius.circular(200),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: -21,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                      onPressed: () {},
                      iconSize: 80,
                      icon: Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ]),
                          child: const Icon(
                            Icons.favorite,
                            size: 30,
                            color: AppColors.spotlessPurple1,
                          ))),
                ))
          ],
        ),
      ),
    );
  }
}

class GenreMusicCard extends StatelessWidget {
  // art_url, title, artist, genre
  final GenrePlaylist music;
  const GenreMusicCard({Key? key, required this.music}) : super(key: key);

  void onGenreMusicCardPressed(BuildContext context) {
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) => AlbumTracks(album: this.music)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onGenreMusicCardPressed(context),
      child: Container(
        height: 145,
        width: 150,
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        music.icons == null
                            ? "https://i.pravatar.cc/300"
                            : music.icons?[0]["url"],
                      ),
                      fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0))),
            ),
            Positioned(
                bottom: 0.4,
                left: 7,
                // right: 5,
                width: 126,
                height: 53,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      color: Colors.grey.withOpacity(0.28),
                    ),
                  ),
                )),
            Positioned(
              bottom: 0,
              left: 5,
              right: 5,
              child: Container(
                height: 52,
                width: 120,
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    gradient: LinearGradient(
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight,
                      colors: [
                        Color.fromRGBO(
                          255,
                          255,
                          255,
                          0.28,
                        ),
                        Color.fromRGBO(255, 255, 255, 0.62),
                        Color.fromRGBO(255, 255, 255, 1.0)
                      ],
                      stops: [1.0, 0.5, 0.0],
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${music.name}".truncateTo(10),
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
