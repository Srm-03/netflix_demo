import 'package:get/get.dart';

class StreamingApp {
  double? score;
  Show? show;

  StreamingApp({
    this.score,
    this.show,
  });

  factory StreamingApp.fromJson(Map<String, dynamic> json) {
    return StreamingApp(
      score: json['score']?.toDouble(),
      show: json['show'] != null ? Show.fromJson(json['show']) : null,
    );
  }
}

class Show {
  int? id;
  String? url;
  String? name;
  String? type;
  Language? language;
  List<String>? genres;
  Status? status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  Network? webChannel;
  dynamic dvdCountry;
  Externals? externals;
  Images? image;
  String? summary;
  int? updated;
  Links? links;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      type: json['type'],
      language: json['language'] != null
          ? Language.values.firstWhereOrNull(
              (e) => e.toString() == 'Language.' + json['language'])
          : null,
      genres: json['genres'] != null ? List<String>.from(json['genres']) : null,
      // status: json['status'] != null
      //     ? Status.values
      //         .firstWhereOrNull((e) => e.toString() == 'Status.' + json['status'],[])
      //     : null,
      runtime: json['runtime'],
      averageRuntime: json['averageRuntime'],
      premiered:
          json['premiered'] != null ? DateTime.parse(json['premiered']) : null,
      ended: json['ended'] != null ? DateTime.parse(json['ended']) : null,
      officialSite: json['officialSite'],
      schedule:
          json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      weight: json['weight'],
      network:
          json['network'] != null ? Network.fromJson(json['network']) : null,
      webChannel: json['webChannel'] != null
          ? Network.fromJson(json['webChannel'])
          : null,
      dvdCountry: json['dvdCountry'],
      externals: json['externals'] != null
          ? Externals.fromJson(json['externals'])
          : null,
      image: json['image'] != null ? Images.fromJson(json['image']) : null,
      summary: json['summary'],
      updated: json['updated'],
      links: json['_links'] != null ? Links.fromJson(json['_links']) : null,
    );
  }
}

class Externals {
  dynamic tvrage;
  int? thetvdb;
  String? imdb;

  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      tvrage: json['tvrage'],
      thetvdb: json['thetvdb'],
      imdb: json['imdb'],
    );
  }
}

class Images {
  String? medium;
  String? original;

  Images({
    this.medium,
    this.original,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      medium: json['medium'],
      original: json['original'],
    );
  }
}

enum Language {
  ENGLISH,
  JAPANESE,
}

class Links {
  Self? self;
  Previousepisode? previousepisode;

  Links({
    this.self,
    this.previousepisode,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'] != null ? Self.fromJson(json['self']) : null,
      previousepisode: json['previousepisode'] != null
          ? Previousepisode.fromJson(json['previousepisode'])
          : null,
    );
  }
}

class Previousepisode {
  String? href;
  String? name;

  Previousepisode({
    this.href,
    this.name,
  });

  factory Previousepisode.fromJson(Map<String, dynamic> json) {
    return Previousepisode(
      href: json['href'],
      name: json['name'],
    );
  }
}

class Self {
  String? href;

  Self({
    this.href,
  });

  factory Self.fromJson(Map<String, dynamic> json) {
    return Self(
      href: json['href'],
    );
  }
}

class Network {
  int? id;
  String? name;
  Country? country;
  String? officialSite;

  Network({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      country:
          json['country'] != null ? Country.fromJson(json['country']) : null,
      officialSite: json['officialSite'],
    );
  }
}

class Country {
  String? name;
  String? code;
  String? timezone;

  Country({
    this.name,
    this.code,
    this.timezone,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      code: json['code'],
      timezone: json['timezone'],
    );
  }
}

class Rating {
  double? average;

  Rating({
    this.average,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average']?.toDouble(),
    );
  }
}

class Schedule {
  String? time;
  List<String>? days;

  Schedule({
    this.time,
    this.days,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'],
      days: json['days'] != null ? List<String>.from(json['days']) : null,
    );
  }
}

enum Status {
  ENDED,
  IN_DEVELOPMENT,
  RUNNING,
}
