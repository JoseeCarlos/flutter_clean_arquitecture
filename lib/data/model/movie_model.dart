import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final List<String> genres;
  final List<String> productionCompanies;

  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.genres,
    required this.productionCompanies,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '',
        voteAverage: json['vote_average']?.toDouble() ?? 0.0,
        voteCount: json['vote_count'] ?? 0,
        releaseDate: json['release_date'] ?? '',
        genres: List<String>.from(json['genres'] ?? const []),
        productionCompanies:
            List<String>.from(json['production_companies'] ?? const []),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'release_date': releaseDate,
      'genres': genres,
      'production_companies': productionCompanies,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        voteAverage,
        voteCount,
        releaseDate,
        genres,
        productionCompanies,
      ];
}
