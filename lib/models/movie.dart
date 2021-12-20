import 'package:movieapp/Models/ratings.dart';

class Movie {
  String title;
  String year;
  String rated;
  String realeased;
  String runTime;
  String director;
  String actors;
  String writer;
  String plot;
  String language;
  String country;
  String imageUrl;
  MovieRatings ratings;

  Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.realeased,
    required this.runTime,
    required this.director,
    required this.actors,
    required this.writer,
    required this.plot,
    required this.language,
    required this.country,
    required this.imageUrl,
    required this.ratings,
  });

  factory Movie.fromJson(dynamic input) {
    MovieRatings ratings = MovieRatings.fromJson(input["Ratings"]);

    String? runtime = durationToString(
        int.parse(input["Runtime"].toString().split(" ").first));
    return Movie(
        title: input["Title"] ?? "",
        year: input["Year"] ?? "",
        rated: input["Rated"] ?? "",
        realeased: input["Released"] ?? "",
        runTime: runtime ?? "",
        director: input["Director"] ?? "",
        actors: input["Actors"] ?? "",
        writer: input["Writer"] ?? "",
        plot: input["Plot"] ?? "",
        language: input["Language"] ?? "",
        country: input["Country"] ?? "",
        imageUrl: input["Poster"] ?? "",
        ratings: ratings);
  }
}

String? durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');

  return '${parts[0]} hours ${parts[1]} minutes';
}
