import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample/bloc/film_bloc.dart';
import 'package:sample/data/movie_datasource.dart';
import 'package:sample/domain/film.dart';

class MockMovieDatasource extends Mock implements MovieDatasource {}

void main() {
  group('FilmBloc', () {
    late MockMovieDatasource mockDatasource;
    late FilmBloc bloc;

    setUp(() {
      mockDatasource = MockMovieDatasource();
      bloc = FilmBloc(mockDatasource);
    });

    final mockFilms = [
      Film(title: 'Test 1', year: 2021),
      Film(title: 'Test 2', year: 2022),
    ];

    blocTest<FilmBloc, FilmState>(
      'emits [FilmLoading, MovieLoaded] when GetFilmEvent is added and fetch is successful',
      build: () {
        when(
          () => mockDatasource.fetchMovies(),
        ).thenAnswer((_) async => mockFilms);
        return bloc;
      },
      act: (bloc) => bloc.add(GetFilmEvent()),
      expect: () => [FilmLoading(), MovieLoaded(mockFilms)],
    );

    blocTest<FilmBloc, FilmState>(
      'emits [FilmLoading, MovieError] when fetch throws exception',
      build: () {
        when(() => mockDatasource.fetchMovies()).thenThrow(Exception('Failed'));
        return bloc;
      },
      act: (bloc) => bloc.add(GetFilmEvent()),
      expect:
          () => [
            FilmLoading(),
            isA<MovieError>().having(
              (e) => e.message,
              'message',
              contains('Failed'),
            ),
          ],
    );
  });
}
