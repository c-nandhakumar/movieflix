part of 'film_bloc.dart';

@immutable
sealed class FilmEvent {}

class GetFilmEvent extends FilmEvent {}
