import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/film_bloc.dart';
import 'package:sample/presentation/widgets/carousal_view.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: BlocBuilder<FilmBloc, FilmState>(
        builder: (context, state) {
          if (state is FilmLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            return CarousalView(films: state.movies);
          } else if (state is MovieError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No data.'));
          }
        },
      ),
    );
  }
}
