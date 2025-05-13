import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable(explicitToJson: true)
class Film {
  final String? title;
  final int? year;
  final List<String>? cast;
  final List<String>? genres;
  final String? href;
  final String? extract;
  final String? thumbnail;
  @JsonKey(name: 'thumbnail_width')
  final int? thumbnailWidth;
  @JsonKey(name: 'thumbnail_height')
  final int? thumbnailHeight;

  Film({
    this.title,
    this.year,
    this.cast,
    this.genres,
    this.href,
    this.extract,
    this.thumbnail,
    this.thumbnailWidth,
    this.thumbnailHeight,
  });

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);

  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
