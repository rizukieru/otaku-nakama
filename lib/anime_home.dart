import 'package:flutter/material.dart';
import 'package:otaku_nakama/anime_detail.dart';

import 'http_helper.dart';

class AnimeHome extends StatefulWidget {
  const AnimeHome({super.key});

  @override
  State<AnimeHome> createState() => _AnimeHomeState();
}

class _AnimeHomeState extends State<AnimeHome> {
  int animeCount = 10;
  List? animeTopOngoing, animeTopAllTime, animeTopUpcoming;
  late HttpHelper helper;

  @override
  void initState() {
    super.initState();
    helper = HttpHelper();
    animeCount = 10;
    animeTopOngoing = [];
    animeTopAllTime = [];
    animeTopUpcoming = [];
    initialize();
  }

  Future initialize() async {
    helper.getTopOngoing().then((response) {
      setState(() {
        animeTopOngoing = response;
      });
    });
    helper.getTopAnime().then((response) {
      setState(() {
        animeTopAllTime = response;
        animeCount = response.length;
      });
    });
    helper.getUpcoming().then((response) {
      setState(() {
        animeTopUpcoming = response;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      const Text(
        'Summer 2023 in Touch',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      SingleChildScrollView(
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int position) {
              return AnimeCategoryWidget(
                animeCategory: animeTopOngoing,
                position: position,
              );
            },
            separatorBuilder: (context, _) => const SizedBox(width: 12),
            itemCount: 10,
          ),
        ),
      ),
      const Text(
        'Best Anime of All Time',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      SingleChildScrollView(
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int position) {
              return AnimeCategoryWidget(
                animeCategory: animeTopAllTime,
                position: position,
              );
            },
            separatorBuilder: (context, _) => const SizedBox(width: 12),
            itemCount: 10,
          ),
        ),
      ),
      const Text(
        'Most Anticipated Upcoming Anime',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      SingleChildScrollView(
        child: SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int position) {
              return AnimeCategoryWidget(
                animeCategory: animeTopUpcoming,
                position: position,
              );
            },
            separatorBuilder: (context, _) => const SizedBox(width: 12),
            itemCount: 10,
          ),
        ),
      ),
    ]));
  }
}

class AnimeCategoryWidget extends StatelessWidget {
  const AnimeCategoryWidget({
    super.key,
    required this.animeCategory,
    required this.position,
  });

  final List? animeCategory;
  final int position;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MaterialPageRoute route = MaterialPageRoute(
              builder: (_) => AnimeDetail(
                    anime: animeCategory![position],
                  ));
          Navigator.push(context, route);
        },
        child: SizedBox(
          height: 280,
          width: 170,
          child: Card(
            color: Colors.white,
            elevation: 2.0,
            margin: const EdgeInsets.all(4.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Image(
                  image: ResizeImage(
                      NetworkImage(
                          animeCategory![position].images.jpg.imageUrl),
                      width: 150,
                      height: 225),
                  fit: BoxFit.fill,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '${animeCategory![position].title}',
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
