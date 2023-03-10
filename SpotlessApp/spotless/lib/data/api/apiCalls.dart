import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:spotless/data/api/release.dart';

final logger = Logger();

void getAllNewReleases() {
  final dio = Dio(); // Provide a dio instance
  // dio.options.headers["Demo-Header"] =
  //     "demo header"; // config your dio headers globally
  final client = RestClient(dio);

  client.getNewReleases().then((it) => logger.i(it));
}
