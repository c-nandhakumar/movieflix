import 'package:flutter/material.dart';

class Constants {
  static final URL =
      "https://raw.githubusercontent.com/prust/wikipedia-movie-data/master/movies.json";

  static final Placeholder =
      "https://thumbs.dreamstime.com/b/movie-film-poster-template-design-modern-retro-vintage-style-can-be-used-background-backdrop-banner-brochure-leaflet-124905876.jpg?w=576";

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
