import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/bloc/film_bloc.dart';
import 'package:sample/constants.dart';
import 'package:sample/data/movie_datasource.dart';
import 'package:sample/locator.dart';
import 'package:sample/presentation/home/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  setupLocator();
  runApp(MovieFlix());
}

class MovieFlix extends StatelessWidget {
  final movieRepository = MovieDatasource(
    apiUrl: Constants.URL,
    client: getIt<http.Client>(),
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(470, 1018),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: Constants.fontFamily,
        ),
        home: BlocProvider(
          create: (_) => FilmBloc(movieRepository)..add(GetFilmEvent()),
          child: MovieScreen(),
        ),
      ),
    );
  }
}
