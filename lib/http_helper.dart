import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import 'anime_map.dart';

class HttpHelper {
  final String urlGetTopOngoing =
      'https://api.jikan.moe/v4/top/anime?filter=airing&type=tv&limit=10';
  final String urlGetSchedules =
      'https://api.jikan.moe/v4/schedules?kids=false';
  final String urlGetTopAnime = 'https://api.jikan.moe/v4/top/anime?type=movie';
  final String urlGetUpcoming =
      'https://api.jikan.moe/v4/top/anime?type=tv&filter=upcoming&limit=10';

  Future<List> getTopOngoing() async {
    Response result = await get(Uri.parse(urlGetTopOngoing));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final List animeSeasonMap = jsonResponse['data'];
      List animeSeason =
          animeSeasonMap.map((e) => AnimeMap.fromJson(e)).toList();
      return animeSeason;
    } else {
      return [];
    }
  }

  Future<List> getSchedules(String urlDay) async {
    String urlGetSchedulesDay = urlGetSchedules + urlDay;
    Response result = await get(Uri.parse(urlGetSchedulesDay));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final List animeSeasonMap = jsonResponse['data'];
      List animeSeason =
          animeSeasonMap.map((e) => AnimeMap.fromJson(e)).toList();
      return animeSeason;
    } else {
      return [];
    }
  }

  Future<List> getTopAnime() async {
    Response result = await get(Uri.parse(urlGetTopAnime));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final List animeSeasonMap = jsonResponse['data'];
      List animeSeason =
          animeSeasonMap.map((e) => AnimeMap.fromJson(e)).toList();
      return animeSeason;
    } else {
      return [];
    }
  }

  Future<List> getUpcoming() async {
    Response result = await get(Uri.parse(urlGetUpcoming));

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final List animeSeasonMap = jsonResponse['data'];
      List animeSeason =
          animeSeasonMap.map((e) => AnimeMap.fromJson(e)).toList();
      return animeSeason;
    } else {
      return [];
    }
  }
}
