import 'package:flutter/material.dart';
import 'package:otaku_nakama/anime_bottom_nav.dart';

void main() {
  runApp(const OtakuNakama());
}

class OtakuNakama extends StatelessWidget {
  const OtakuNakama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otaku Nakama',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimeNavBar();
  }
}
