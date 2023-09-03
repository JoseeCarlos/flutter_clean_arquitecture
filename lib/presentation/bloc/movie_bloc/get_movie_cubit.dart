import 'package:example_project_api/core/usecases.dart';
import 'package:example_project_api/domain/usecase/get_movies_usecase.dart';
import 'package:example_project_api/presentation/bloc/movie_bloc/get_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMovieCubit extends Cubit<GetMovieState> {
  GetMovieCubit({required this.getMovieUseCase}) : super(GetMovieInitial());
  final GetMoviesUseCase getMovieUseCase;

  Future<void> getMovies() {
    emit(GetMovieLoading());

    return getMovieUseCase(NoParams()).then((response) {
      response.fold(
        (failure) => emit(GetMovieFailure(message: failure.message)),
        (movies) => emit(GetMovieLoaded(movies: movies)),
      );
    });
  }
}
