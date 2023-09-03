import 'package:dartz/dartz.dart';
import 'package:example_project_api/core/failures.dart';
import 'package:example_project_api/domain/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<MovieFailure, List<MovieEntity>>> getMovies();
}
