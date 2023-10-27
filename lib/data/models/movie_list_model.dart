class MovieListModel {
  MovieListModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  factory MovieListModel.fromJson(Map<String, dynamic> json){
    return MovieListModel(
      page: json["page"] ?? 0,
      results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      totalPages: json["total_pages"] ?? 0,
      totalResults: json["total_results"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": results.map((x) => x?.toJson()).toList(),
    "total_pages": totalPages,
    "total_results": totalResults,
  };

}

class Result {
  Result({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  });

  final String backdropPath;
  final DateTime? firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final double voteAverage;
  final int voteCount;

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      backdropPath: json["backdrop_path"] ?? "",
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"] ?? "",
      originalName: json["original_name"] ?? "",
      overview: json["overview"] ?? "",
      popularity: json["popularity"] ?? 0.0,
      posterPath: json["poster_path"] ?? "",
      voteAverage: json["vote_average"] ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "first_air_date": "${firstAirDate!.year.toString().padLeft(4,'0')}-${firstAirDate!.month.toString().padLeft(2,'0')}-${firstAirDate!.day.toString().padLeft(2,'0')}",
    "genre_ids": genreIds.map((x) => x).toList(),
    "id": id,
    "name": name,
    "origin_country": originCountry.map((x) => x).toList(),
    "original_language": originalLanguage,
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };

}
