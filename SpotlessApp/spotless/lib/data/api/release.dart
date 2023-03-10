import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'release.g.dart';

@RestApi(baseUrl: "https://spotless.up.railway.app")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/release")
  Future<List<ReleaseAlbum>> getNewReleases();
}

@JsonSerializable()
class ReleaseAlbum {
  String? album_type;
  List? artists;
  List? available_markets;
  Map? external_urls;
  String? href;
  String? id;
  List? images;
  String? name;
  String? release_date;
  String? release_date_precision;
  int? total_tracks;
  String? type;
  String? uri;

  ReleaseAlbum(
      {this.album_type,
      this.artists,
      this.available_markets,
      this.external_urls,
      this.href,
      this.id,
      this.images,
      this.name,
      this.release_date,
      this.release_date_precision,
      this.total_tracks,
      this.type,
      this.uri});

  factory ReleaseAlbum.fromJson(Map<String, dynamic> json) =>
      _$ReleaseAlbumFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseAlbumToJson(this);
}
