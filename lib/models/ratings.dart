// ignore_for_file: avoid_print

class MovieRatings {
  Map<String, String> ratings;

  MovieRatings(this.ratings);

  factory MovieRatings.fromJson(dynamic array) {
    Map<String, String> ratings = {};

    for (int i = 0; i < array.length; i++) {
      try {
        ratings[array[i]["Source"]] = array[i]["Value"] ?? "";
      } catch (e) {
        print(e.toString());
        continue;
      }
    }

    return MovieRatings(ratings);
  }
}
