// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseAlbum _$ReleaseAlbumFromJson(Map<String, dynamic> json) => ReleaseAlbum(
      album_type: json['album_type'] as String?,
      artists: json['artists'] as List<dynamic>?,
      available_markets: json['available_markets'] as List<dynamic>?,
      external_urls: json['external_urls'] as Map<String, dynamic>?,
      href: json['href'] as String?,
      id: json['id'] as String?,
      images: json['images'] as List<dynamic>?,
      name: json['name'] as String?,
      release_date: json['release_date'] as String?,
      release_date_precision: json['release_date_precision'] as String?,
      total_tracks: json['total_tracks'] as int?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$ReleaseAlbumToJson(ReleaseAlbum instance) =>
    <String, dynamic>{
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

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://spotless.up.railway.app';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<ReleaseAlbum>> getNewReleases() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<ReleaseAlbum>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/release',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => ReleaseAlbum.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
