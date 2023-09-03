import 'package:example_project_api/data/remote/movie_remote_data_source.dart';
import 'package:example_project_api/data/repository/movie_repository_implementation.dart';
import 'package:example_project_api/domain/repository/movie_repository.dart';
import 'package:example_project_api/domain/usecase/get_movies_usecase.dart';
import 'package:example_project_api/presentation/bloc/movie_bloc/get_movie_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //
  //DataSource
  //
  sl.registerFactory<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImplementation());

  //
  //Repository
  //

  sl.registerFactory<MovieRepository>(
      () => MovieRepositoryImplementation(movieRemoteDataSource: sl()));

  //
  //useCase
  //
  sl.registerFactory<GetMoviesUseCase>(
      () => GetMoviesUseCase(movieRepository: sl()));

  //
  //Bloc
  //

  sl.registerSingleton<GetMovieCubit>(GetMovieCubit(getMovieUseCase: sl()));
}
