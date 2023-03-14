import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:spotless/data/models/album.dart';
import 'package:spotless/data/models/genreplaylist.dart';
import 'package:spotless/data/models/track.dart';

part 'endpoints.g.dart';

@RestApi(baseUrl: "https://spotless.up.railway.app")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/release")
  Future<List<Album>> getNewReleases();

  @GET("/trending")
  Future<List<Album>> getTrendingAlbums();

  @GET("/albumTracks/{id}")
  Future<List<Track>> getAlbumTracks(@Path("id") String id);

  @GET("/genre")
  Future<List<GenrePlaylist>> getTopGenreList();

  @GET("/lyrics")
  Future<String> getSongLyrics(
      @Query('songtitle') String songtitle, @Query('artist') String artist);
}
