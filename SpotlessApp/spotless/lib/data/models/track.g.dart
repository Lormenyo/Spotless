// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Track _$TrackFromJson(Map<String, dynamic> json) => Track(
      disc_number: json['disc_number'] as int?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      available_markets: json['available_markets'] as List<dynamic>?,
      external_urls: json['external_urls'] as Map<String, dynamic>?,
      href: json['href'] as String?,
      id: json['id'] as String?,
      duration_ms: json['duration_ms'] as int?,
      name: json['name'] as String?,
      explicit: json['explicit'] as bool?,
      is_local: json['is_local'] as bool?,
      preview_url: json['preview_url'] as String?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    )..track_number = json['track_number'] as int?;

Map<String, dynamic> _$TrackToJson(Track instance) => <String, dynamic>{
      'artists': instance.artists,
      'available_markets': instance.available_markets,
      'external_urls': instance.external_urls,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri,
      'disc_number': instance.disc_number,
      'duration_ms': instance.duration_ms,
      'explicit': instance.explicit,
      'is_local': instance.is_local,
      'preview_url': instance.preview_url,
      'track_number': instance.track_number,
    };
