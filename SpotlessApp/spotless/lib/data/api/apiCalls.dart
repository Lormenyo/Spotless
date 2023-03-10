import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:spotless/data/api/release.dart';

final logger = Logger();

Future<List<ReleaseAlbum>> getAllNewReleases() {
  final dio = Dio(); // Provide a dio instance
  // dio.options.headers["Demo-Header"] =
  //     "demo header"; // config your dio headers globally
  final client = RestClient(dio);

  logger.i('Fetching data');

  return client.getNewReleases();
}
