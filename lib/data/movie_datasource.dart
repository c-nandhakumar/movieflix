import 'dart:convert';

import 'package:sample/domain/film.dart';
import 'package:http/http.dart' as http;

class MovieDatasource {
  final String apiUrl;

  MovieDatasource({required this.apiUrl});

  Future<List<Film>> fetchMovies() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
