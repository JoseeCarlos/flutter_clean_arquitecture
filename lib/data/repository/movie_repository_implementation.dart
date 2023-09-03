import 'package:dartz/dartz.dart';
import 'package:example_project_api/core/failures.dart';

import 'package:example_project_api/data/remote/movie_remote_data_source.dart';
import 'package:example_project_api/domain/entity/movie_entity.dart';
import 'package:example_project_api/domain/repository/movie_repository.dart';

class MovieRepositoryImplementation extends MovieRepository {
  MovieRepositoryImplementation({required this.movieRemoteDataSource});
  final MovieRemoteDataSource movieRemoteDataSource;

  @override
  Future<Either<MovieFailure, List<MovieEntity>>> getMovies() async {
    try {
      final movies = await movieRemoteDataSource.getMovies();
      final movieEntity = movies
          .map((e) => MovieEntity(
              id: e.id,
              title: e.title,
              overview: e.overview,
              posterPath: e.posterPath,
              voteAverage: e.voteAverage,
              voteCount: e.voteCount,
              releaseDate: e.releaseDate,
              genres: e.genres,
              productionCompanies: e.productionCompanies))
          .toList();

      return Right(movieEntity);
    } catch (e) {
      return Future.value(Left(
          MovieFailure('Error al obtener las peliculas: ${e.toString()}')));
    }
  }
}
