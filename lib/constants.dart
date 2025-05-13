import 'package:flutter/material.dart';

class Constants {
  static final URL =
      "https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies.json";

  static final Placeholder =
      "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=1024x1024&w=is&k=20&c=5aen6wD1rsiMZSaVeJ9BWM4GGh5LE_9h97haNpUQN5I=";

  static final textColor = Color(0xFF12153D);
  static final primaryColor = Color(0xFFFE6D8E);
  static final textColorLight = Color(0xFF9A9BB2);

  static final primaryShadow = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 4,
    color: Colors.black26,
  );

  static final defaultPadding = 20.0;

  static final fontFamily = "ProximaNova";
}
