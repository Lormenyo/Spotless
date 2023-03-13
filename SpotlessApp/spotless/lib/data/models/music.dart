class Music {
  String artUrl;
  String title;
  String artistName;
  String genre;
  String artistImage;
  String? url;

  Music(
      {required this.artUrl,
      required this.title,
      required this.genre,
      required this.artistName,
      required this.artistImage,
      this.url});
}
