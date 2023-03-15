import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:spotless/data/api/endpoints.dart';
import 'package:spotless/data/models/album.dart';
import 'package:spotless/data/models/genreplaylist.dart';
import 'package:spotless/data/models/track.dart';

final logger = Logger();
final dio = Dio(); // Provide a dio instance
// dio.options.headers["Demo-Header"] =
//     "demo header"; // config your dio headers globally
final client = RestClient(dio);

Future<List<Album>> getAllNewReleases() {
  logger.i('Fetching new releases');

  return client.getNewReleases();
}

Future<List<Album>> getAllTrendingAlbums() {
  logger.i('Fetching trending albums');

  return client.getTrendingAlbums();
}

Future<List<Track>> getAllAlbumTracks(String id) {
  logger.i('Fetching all album tracks');

  return client.getAlbumTracks(id);
}

Future<List<GenrePlaylist>> getAllTopGenreList() {
  logger.i('Fetching all Genre Playlist');

  return client.getTopGenreList();
}

Future<String> getSongLyrics(String song, String artist) {
  logger.i('Fetching Song Lyrics');
  client.getSongLyrics(song, artist).then((value) => logger.i(value));
  return client.getSongLyrics(song, artist);
}
