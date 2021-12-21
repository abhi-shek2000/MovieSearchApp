// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:movieapp/api/networkservice/movie_api.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/movie_short.dart';
import 'package:movieapp/models/ratings.dart';

class MovieSearch {
  final NetworkService _networkService = NetworkService();

  Future<List<MovieInShort>> searchMovie(String title) async {
    var rawResponse;
    rawResponse =
        await _networkService.searchMoviesapiCall(title, tryingNum: 0);

    final response = jsonDecode(rawResponse);

    if (response["Response"] == "False") throw "Not Found";

    final jsonMovies = response["Search"];
    List<MovieInShort> lisOfMovies = [];

    for (var each in jsonMovies) {
      if ((each["Type"] == "movie")) {
        lisOfMovies.add(MovieInShort.fromJson(each));
      }
    }

    return lisOfMovies;
  }

  static Future<Movie> searchbyImdbID(String id) async {
    final NetworkService _networkService = NetworkService();

    var rawResponse;
    rawResponse = await _networkService.searchbyImdbapiCall(id, tryingNum: 0);

    final response = jsonDecode(rawResponse);

    if (response["Response"] == "False") throw "Not Found";
    return Movie.fromJson(response);
  }
}
