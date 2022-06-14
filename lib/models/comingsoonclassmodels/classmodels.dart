import 'package:json_annotation/json_annotation.dart';

part 'classmodels.g.dart';

@JsonSerializable()
class Classmodels {
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  bool? video;
  String? title;
  int? id;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  String? overview;
  double? popularity;
  @JsonKey(name: 'media_type')
  String? mediaType;

  Classmodels({
    this.genreIds,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.video,
    this.title,
    this.id,
    this.releaseDate,
    this.voteCount,
    this.voteAverage,
    this.adult,
    this.backdropPath,
    this.overview,
    this.popularity,
    this.mediaType,
  });

  factory Classmodels.fromJson(Map<String, dynamic> json) {
    return _$ClassmodelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ClassmodelsToJson(this);
}
