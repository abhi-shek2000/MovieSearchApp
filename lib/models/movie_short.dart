class MovieInShort {
  String title;
  String year;
  String imdbID;
  String type;
  String imageUrl;

  MovieInShort(
      {required this.title,
      required this.year,
      required this.imdbID,
      required this.type,
      required this.imageUrl});

  factory MovieInShort.fromJson(dynamic input) {
    return MovieInShort(
        title: input["Title"] ?? "",
        year: input["Year"] ?? "",
        type: input["Type"] ?? "",
        imdbID: input["imdbID"] ?? "",
        imageUrl: input["Poster"] ?? "");
  }
}
