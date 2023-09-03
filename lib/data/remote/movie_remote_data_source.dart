import 'dart:convert';

import 'package:example_project_api/data/model/movie_model.dart';
import 'package:example_project_api/data/remote/tmdb_api.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getMovies();
}

class MovieRemoteDataSourceImplementation extends MovieRemoteDataSource {
  final baseUrl = TmdbApi.baseUrl;
  final apiKey = TmdbApi.apikey;
  @override
  Future<List<MovieModel>> getMovies() async {
    final response =
        await http.get(Uri.parse('$baseUrl/discover/movie?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      final movies =
          results.map((movie) => MovieModel.fromJson(movie)).toList();

      return movies;
    } else {
      throw Exception('Error al obtener las peliculas');
    }
  }
}
