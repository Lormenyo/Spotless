getArtistNames(List artists) {
  String artistsStr = "";
  for (var i = 0; i < artists.length; i++) {
    i > 0
        ? artistsStr += ", ${artists[i]['name']}"
        : artistsStr += "${artists[i]['name']}";
  }
  return artistsStr;
}
