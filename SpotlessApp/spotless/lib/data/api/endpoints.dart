
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:spotless/data/models/album.dart';

part 'endpoints.g.dart';

@RestApi(baseUrl: "https://spotless.up.railway.app")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/release")
  Future<List<Album>> getNewReleases();

  @GET("/trending")
  Future<List<Album>> getTrendingAlbums();
}
