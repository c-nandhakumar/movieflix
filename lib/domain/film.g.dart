// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) => Film(
  title: json['title'] as String?,
  year: (json['year'] as num?)?.toInt(),
  cast: (json['cast'] as List<dynamic>?)?.map((e) => e as String).toList(),
  genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
  href: json['href'] as String?,
  extract: json['extract'] as String?,
  thumbnail: json['thumbnail'] as String?,
  thumbnailWidth: (json['thumbnail_width'] as num?)?.toInt(),
  thumbnailHeight: (json['thumbnail_height'] as num?)?.toInt(),
);

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
  'title': instance.title,
  'year': instance.year,
  'cast': instance.cast,
  'genres': instance.genres,
  'href': instance.href,
  'extract': instance.extract,
  'thumbnail': instance.thumbnail,
  'thumbnail_width': instance.thumbnailWidth,
  'thumbnail_height': instance.thumbnailHeight,
};
