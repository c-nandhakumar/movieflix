import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:sample/constants.dart';
import 'dart:convert';

import 'package:sample/data/movie_datasource.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('MovieDatasource', () {
    late MockClient mockClient;
    late MovieDatasource datasource;

    setUpAll(() {
      registerFallbackValue(Uri());
    });

    setUp(() {
      mockClient = MockClient();
      datasource = MovieDatasource(apiUrl: Constants.URL, client: mockClient);
    });

    test('returns list of films on successful response', () async {
      final mockJson = jsonEncode([
        {"title": "Movie A", "year": 2022},
        {"title": "Movie B", "year": 2023},
      ]);

      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response(mockJson, 200));

      final films = await datasource.fetchMovies();

      expect(films.length, 2);
      expect(films[0].title, 'Movie A');
    });

    test('throws exception on error response', () async {
      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response('Server error', 500));

      expect(() => datasource.fetchMovies(), throwsException);
    });
  });
}
