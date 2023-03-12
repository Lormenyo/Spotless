import 'package:json_annotation/json_annotation.dart';

part 'track.g.dart';

@JsonSerializable()
class Track {
  List<Map<String, dynamic>>? artists;
  List? available_markets;
  Map? external_urls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;
  int? disc_number;
  int? duration_ms;
  bool? explicit;
  bool? is_local;
  String? preview_url;
  int? track_number;

  Track(
      {this.disc_number,
      this.artists,
      this.available_markets,
      this.external_urls,
      this.href,
      this.id,
      this.duration_ms,
      this.name,
      this.explicit,
      this.is_local,
      this.preview_url,
      this.type,
      this.uri});

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
