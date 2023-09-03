import 'package:dartz/dartz.dart';
import 'package:example_project_api/core/failures.dart';
import 'package:example_project_api/core/usecases.dart';
import 'package:example_project_api/domain/entity/movie_entity.dart';
import 'package:example_project_api/domain/repository/movie_repository.dart';

class GetMoviesUseCase extends FutureUsesCase<List<MovieEntity>, NoParams> {
  GetMoviesUseCase({required this.movieRepository});
  final MovieRepository movieRepository;

  @override
  Future<Either<MovieFailure, List<MovieEntity>>> call(NoParams params) {
    return movieRepository.getMovies();
  }
}
