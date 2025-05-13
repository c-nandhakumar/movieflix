part of 'film_bloc.dart';

@immutable
sealed class FilmState {}

final class FilmInitial extends FilmState {}

final class FilmLoading extends FilmState {}

class MovieLoaded extends FilmState {
  final List<Film> movies;

  MovieLoaded(this.movies);
}

class MovieError extends FilmState {
  final String message;

  MovieError(this.message);
}
