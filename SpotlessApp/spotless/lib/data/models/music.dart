import 'package:flutter/material.dart';

class Music {
  String artUrl;
  String title;
  String artistName;
  String genre;
  String artistImage;

  Music(
      {required this.artUrl,
      required this.title,
      required this.genre,
      required this.artistName,
      required this.artistImage});
}
