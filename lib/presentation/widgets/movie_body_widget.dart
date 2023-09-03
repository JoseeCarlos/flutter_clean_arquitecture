import 'package:example_project_api/domain/entity/movie_entity.dart';
import 'package:flutter/material.dart';

class MovieBodyWidget extends StatelessWidget {
  const MovieBodyWidget({required this.movieEntity, super.key});
  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RELEASE DATE: ${movieEntity.releaseDate}',
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w800),
            ),
            const SizedBox(width: 10),
            Text(
              'VOTES: ${movieEntity.voteCount}',
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 7, // Ocupa el 70% del ancho disponible
                child: Text(
                  movieEntity.title,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/userPage');
                  },
                  child: Text('Pantalla del usuario')),
              Card(
                color: Color.fromARGB(255, 88, 87, 88),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        movieEntity.voteAverage.toString(),
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          movieEntity.overview,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    ]);
  }
}
