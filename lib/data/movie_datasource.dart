import 'dart:convert';

import 'package:sample/domain/film.dart';
import 'package:http/http.dart' as http;

class MovieDatasource {
  final String apiUrl;
  final http.Client client;

  MovieDatasource({required this.apiUrl, http.Client? client})
    : client = client ?? http.Client();

  Future<List<Film>> fetchMovies() async {
    final response = await client.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print("Response");
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
