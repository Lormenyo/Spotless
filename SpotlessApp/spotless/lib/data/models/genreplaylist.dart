import 'package:json_annotation/json_annotation.dart';

part 'genreplaylist.g.dart';

@JsonSerializable()
class GenrePlaylist {
  String? href;
  String? id;
  List<Map>? icons;
  String? name;

  GenrePlaylist({
    this.href,
    this.id,
    this.icons,
    this.name,
  });

  factory GenrePlaylist.fromJson(Map<String, dynamic> json) =>
      _$GenrePlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$GenrePlaylistToJson(this);
}
