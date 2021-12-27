class MoviesModel {
  late bool adult;
  late String backdropPath;
  late List<int> genreIds;
  late int id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late String releaseDate;
  late String title;
  late bool video;

  late int voteCount;

  MoviesModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteCount,
  });

  MoviesModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = "https://image.tmdb.org/t/p/original" +
        json['backdrop_path'].toString();
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath =
        "https://image.tmdb.org/t/p/original" + json['poster_path'].toString();
    releaseDate = json['release_date'].toString();
    title = json['title'].toString();
    video = json['video'];

    voteCount = json['vote_count'];
  }
}
