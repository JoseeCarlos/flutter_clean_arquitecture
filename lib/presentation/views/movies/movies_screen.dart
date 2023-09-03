import 'package:example_project_api/core/inyection_container.dart';
import 'package:example_project_api/presentation/bloc/movie_bloc/get_movie_cubit.dart';
import 'package:example_project_api/presentation/bloc/movie_bloc/get_movie_state.dart';
import 'package:example_project_api/presentation/widgets/movies_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  // Variable para rastrear la película actualmente visible

  @override
  Widget build(BuildContext context) {
    sl<GetMovieCubit>().getMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
              fontFamily: AutofillHints.birthdayMonth,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<GetMovieCubit, GetMovieState>(
        bloc: sl<GetMovieCubit>(),
        builder: (context, state) {
          if (state is GetMovieFailure) {
            return Center(
                child: Text(
              state.message,
              style: TextStyle(color: Colors.white),
            ));
          }

          if (state is GetMovieLoaded) {
            final movies = state.movies;

            if (movies.isEmpty) {
              return const Center(child: Text('No hay peliculas'));
            }

            return MoviesDetailsWidget(
              movies: movies,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
