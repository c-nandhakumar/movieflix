import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sample/data/movie_datasource.dart';
import 'package:sample/domain/film.dart';

part 'film_event.dart';
part 'film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final MovieDatasource dataSource;
  FilmBloc(this.dataSource) : super(FilmInitial()) {
    on<GetFilmEvent>((event, emit) async {
      emit(FilmLoading());
      try {
        final movies = await dataSource.fetchMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
}
