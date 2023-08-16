import 'package:flutter/material.dart';

import 'anime_map.dart';

class AnimeDetail extends StatelessWidget {
  final AnimeMap anime;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  const AnimeDetail({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    String? path;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (anime.images!.jpg!.imageUrl != null) {
      path = anime.images!.jpg!.imageUrl;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title!),
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              height: height / 2.4,
              width: width / 1.7,
              child: Image.network(
                path!,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
                child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Score:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(anime.score.toString()),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Studio:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(anime.studios![0].studioName.toString()),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Episodes:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(anime.episodes.toString()),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Duration:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(anime.duration.toString()),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Rating:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(anime.rating.toString()),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Season:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${anime.season} ${anime.year}'),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Source:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(anime.source.toString()),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            )),
          ],
        ),
        Row(
          children: <Widget>[
            const Text(
              'Synopsis:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(anime.synopsis.toString()),
            ),
          ],
        ),
      ])),
    );
  }
}
