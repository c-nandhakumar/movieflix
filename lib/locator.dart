import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sample/data/movie_datasource.dart';
import 'constants.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  getIt.registerLazySingleton<MovieDatasource>(
    () => MovieDatasource(apiUrl: Constants.URL, client: getIt<http.Client>()),
  );
}
