// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classmodels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Classmodels _$ClassmodelsFromJson(Map<String, dynamic> json) => Classmodels(
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      video: json['video'] as bool?,
      title: json['title'] as String?,
      id: json['id'] as int?,
      releaseDate: json['release_date'] as String?,
      voteCount: json['vote_count'] as int?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$ClassmodelsToJson(Classmodels instance) =>
    <String, dynamic>{
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'video': instance.video,
      'title': instance.title,
      'id': instance.id,
      'release_date': instance.releaseDate,
      'vote_count': instance.voteCount,
      'vote_average': instance.voteAverage,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'media_type': instance.mediaType,
    };
