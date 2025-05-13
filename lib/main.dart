import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/film_bloc.dart';
import 'package:sample/constants.dart';
import 'package:sample/data/movie_datasource.dart';
import 'package:sample/presentation/home_page.dart';

void main() {
  runApp(MovieFlix());
}

class MovieFlix extends StatelessWidget {
  final movieRepository = MovieDatasource(apiUrl: Constants.URL);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: BlocProvider(
        create: (_) => FilmBloc(movieRepository)..add(GetFilmEvent()),
        child: MovieScreen(),
      ),
    );
  }
}
