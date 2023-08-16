class AnimeMap {
  Images? images;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  String? source;
  int? episodes;
  String? duration;
  String? rating;
  double? score;
  int? members;
  String? synopsis;
  String? season;
  int? year;
  Broadcast? broadcast;
  List<Studios>? studios;
  List<Genres>? genres;
  List<Themes>? themes;
  List<Demographics>? demographics;

  AnimeMap(
      {this.images,
      this.title,
      this.titleEnglish,
      this.titleJapanese,
      this.source,
      this.episodes,
      this.duration,
      this.rating,
      this.score,
      this.members,
      this.synopsis,
      this.season,
      this.year,
      this.broadcast,
      this.studios,
      this.genres,
      this.themes,
      this.demographics});

  AnimeMap.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    title = json['title'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];
    source = json['source'];
    episodes = json['episodes'];
    duration = json['duration'];
    rating = json['rating'];
    score = json['score'];
    members = json['members'];
    synopsis = json['synopsis'];
    season = json['season'];
    year = json['year'];
    broadcast = json['broadcast'] != null
        ? Broadcast.fromJson(json['broadcast'])
        : null;
    if (json['studios'] != null) {
      studios = <Studios>[];
      json['studios'].forEach((v) {
        studios!.add(Studios.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    if (json['themes'] != null) {
      themes = <Themes>[];
      json['themes'].forEach((v) {
        themes!.add(Themes.fromJson(v));
      });
    }
    if (json['demographics'] != null) {
      demographics = <Demographics>[];
      json['demographics'].forEach((v) {
        demographics!.add(Demographics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['title'] = title;
    data['title_english'] = titleEnglish;
    data['title_japanese'] = titleJapanese;
    data['source'] = source;
    data['episodes'] = episodes;
    data['duration'] = duration;
    data['rating'] = rating;
    data['score'] = score;
    data['members'] = members;
    data['synopsis'] = synopsis;
    data['season'] = season;
    data['year'] = year;
    if (broadcast != null) {
      data['broadcast'] = broadcast!.toJson();
    }
    if (studios != null) {
      data['studios'] = studios!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (themes != null) {
      data['themes'] = themes!.map((v) => v.toJson()).toList();
    }
    if (demographics != null) {
      data['demographics'] = demographics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  Jpg? jpg;

  Images({this.jpg});

  Images.fromJson(Map<String, dynamic> json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jpg != null) {
      data['jpg'] = jpg!.toJson();
    }
    return data;
  }
}

class Jpg {
  String? imageUrl;

  Jpg({this.imageUrl});

  Jpg.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image_url'] = imageUrl;
    return data;
  }
}

class Broadcast {
  String? day;
  String? time;

  Broadcast({this.day, this.time});

  Broadcast.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['time'] = time;
    return data;
  }
}

class Studios {
  String? studioName;

  Studios({this.studioName});

  Studios.fromJson(Map<String, dynamic> json) {
    studioName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['studioName'] = studioName;
    return data;
  }
}

class Genres {
  String? genreName;

  Genres({this.genreName});

  Genres.fromJson(Map<String, dynamic> json) {
    genreName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genreName'] = genreName;
    return data;
  }
}

class Themes {
  String? themeName;

  Themes({this.themeName});

  Themes.fromJson(Map<String, dynamic> json) {
    themeName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['themeName'] = themeName;
    return data;
  }
}

class Demographics {
  String? demographicName;

  Demographics({this.demographicName});

  Demographics.fromJson(Map<String, dynamic> json) {
    demographicName = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['demographicName'] = demographicName;
    return data;
  }
}
