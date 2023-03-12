// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      album_type: json['album_type'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      available_markets: json['available_markets'] as List<dynamic>?,
      external_urls: json['external_urls'] as Map<String, dynamic>?,
      href: json['href'] as String?,
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      name: json['name'] as String?,
      release_date: json['release_date'] as String?,
      release_date_precision: json['release_date_precision'] as String?,
      total_tracks: json['total_tracks'] as int?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'album_type': instance.album_type,
      'artists': instance.artists,
      'available_markets': instance.available_markets,
      'external_urls': instance.external_urls,
      'href': instance.href,
      'id': instance.id,
      'images': instance.images,
      'name': instance.name,
      'release_date': instance.release_date,
      'release_date_precision': instance.release_date_precision,
      'total_tracks': instance.total_tracks,
      'type': instance.type,
      'uri': instance.uri,
    };
