// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genreplaylist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenrePlaylist _$GenrePlaylistFromJson(Map<String, dynamic> json) =>
    GenrePlaylist(
      href: json['href'] as String?,
      id: json['id'] as String?,
      icons: (json['icons'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenrePlaylistToJson(GenrePlaylist instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
      'icons': instance.icons,
      'name': instance.name,
    };
