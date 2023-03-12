import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  String? album_type;
  List<Map<String, dynamic>>? artists;
  List? available_markets;
  Map? external_urls;
  String? href;
  String? id;
  List<Map>? images;
  String? name;
  String? release_date;
  String? release_date_precision;
  int? total_tracks;
  String? type;
  String? uri;

  Album(
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

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
