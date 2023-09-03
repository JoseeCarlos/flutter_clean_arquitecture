import 'package:carousel_slider/carousel_slider.dart';
import 'package:example_project_api/domain/entity/movie_entity.dart';
import 'package:example_project_api/presentation/widgets/movie_body_widget.dart';
import 'package:flutter/material.dart';

class MoviesDetailsWidget extends StatefulWidget {
  const MoviesDetailsWidget({required this.movies, super.key});
  final List<MovieEntity> movies;

  @override
  State<MoviesDetailsWidget> createState() => _MoviesDetailsWidgetState();
}

class _MoviesDetailsWidgetState extends State<MoviesDetailsWidget> {
  int currentMovieIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: Column(children: [
          CarouselSlider(
            items: widget.movies
                .map((e) => Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${e.posterPath}',
                            fit: BoxFit.cover,
                            width: 1000.0,
                          )),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 600,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentMovieIndex = index;
                });
              },
            ),
          ),
          MovieBodyWidget(movieEntity: widget.movies[currentMovieIndex])
        ]),
      ),
    ]);
  }
}
