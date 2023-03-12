import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:spotless/data/api/endpoints.dart';
import 'package:spotless/data/models/album.dart';

final logger = Logger();
final dio = Dio(); // Provide a dio instance
// dio.options.headers["Demo-Header"] =
//     "demo header"; // config your dio headers globally
final client = RestClient(dio);

Future<List<Album>> getAllNewReleases() {
  logger.i('Fetching new releases');

  return client.getNewReleases();
}

Future<List<Album>> getAllTrendingAlbums() {
  logger.i('Fetching trending albums');

  return client.getTrendingAlbums();
}
