// {"Title":"The Avengers","Year":"2012","Rated":"PG-13","Released":"04 May 2012",
// "Runtime":"143 min","Genre":"Action, Adventure, Sci-Fi","Director":"Joss Whedon",
// "Writer":"Joss Whedon, Zak Penn","Actors":"Robert Downey Jr., Chris Evans, Scarlett Johansson",
// "Plot":"Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.","Language":"English, Russian, Hindi",
// "Country":"United States","Awards":"Nominated for 1 Oscar. 38 wins & 80 nominations total",
// "Poster":"https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
// "Ratings":[{"Source":"Internet Movie Database","Value":"8.0/10"},{"Source":"Rotten Tomatoes","Value":"91%"},{"Source":"Metacritic","Value":"69/100"}],
// "Metascore":"69","imdbRating":"8.0","imdbVotes":"1,317,457","imdbID":"tt0848228","Type":"movie","DVD":"25 Sep 2012","BoxOffice":"$623,357,910","Production":"N/A","Website":"N/A","Response":"True"}

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
  String imdbRating;
  String imdbID;
  String genre;

  MovieRatings ratings;

  Movie(
      {required this.title,
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
      required this.imdbRating,
      required this.genre,
      required this.imdbID});

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
        imdbID: input["imdbID"],
        genre: input["Genre"],
        imdbRating: input["imdbRating"] ?? "",
        ratings: ratings);
  }
}

String? durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');

  return '${parts[0]} hours ${parts[1]} minutes';
}
