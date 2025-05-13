part of 'film_bloc.dart';

abstract class FilmState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FilmInitial extends FilmState {}

class FilmLoading extends FilmState {}

class MovieLoaded extends FilmState {
  final List<Film> films;
  MovieLoaded(this.films);

  @override
  List<Object?> get props => [films];
}

class MovieError extends FilmState {
  final String message;
  MovieError(this.message);

  @override
  List<Object?> get props => [message];
}
