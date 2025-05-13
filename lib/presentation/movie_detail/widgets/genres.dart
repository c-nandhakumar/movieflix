import 'package:flutter/material.dart';
import 'package:sample/constants.dart';
import 'package:sample/domain/film.dart';
import 'package:sample/presentation/home/widgets/genre_widget.dart';

class Genres extends StatelessWidget {
  const Genres({Key? key, required this.movie}) : super(key: key);

  final Film movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Constants.defaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movie.genres?.length,
          itemBuilder:
              (context, index) =>
                  movie.genres != null
                      ? GenreCard(genre: movie.genres![index])
                      : SizedBox(),
        ),
      ),
    );
  }
}
