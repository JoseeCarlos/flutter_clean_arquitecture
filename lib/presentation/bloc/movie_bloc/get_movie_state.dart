import 'package:equatable/equatable.dart';
import 'package:example_project_api/domain/entity/movie_entity.dart';

abstract class GetMovieState extends Equatable {
  const GetMovieState();

  @override
  List<Object> get props => [];
}

class GetMovieInitial extends GetMovieState {}

class GetMovieLoading extends GetMovieState {}

class GetMovieLoaded extends GetMovieState {
  final List<MovieEntity> movies;

  const GetMovieLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class GetMovieFailure extends GetMovieState {
  final String message;

  const GetMovieFailure({required this.message});

  @override
  List<Object> get props => [message];
}
