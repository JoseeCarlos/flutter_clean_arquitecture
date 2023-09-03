import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final List<String> genres;
  final List<String> productionCompanies;

  const MovieEntity({
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
