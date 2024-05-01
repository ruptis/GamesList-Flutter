import 'dart:core';

class GameDto {
  final String id;
  final String title;
  final String developer;
  final String publisher;
  final String releaseDate;
  final List<String> genres;
  final List<String> platforms;
  final String description;
  final List<String> screenshots;
  final String cover;

  GameDto(
      {required this.id,
      required this.title,
      required this.developer,
      required this.publisher,
      required this.releaseDate,
      required this.genres,
      required this.platforms,
      required this.description,
      required this.screenshots,
      required this.cover});

  factory GameDto.fromJson(Map<String, dynamic> json, String id) {
    return GameDto(
        id: id,
        title: json['title'],
        developer: json['developer'],
        publisher: json['publisher'],
        releaseDate: json['releaseDate'],
        genres: List<String>.from(json['genres']),
        platforms: List<String>.from(json['platforms']),
        description: json['description'],
        screenshots: List<String>.from(json['screenshots']),
        cover: json['cover']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'developer': developer,
      'publisher': publisher,
      'releaseDate': releaseDate,
      'genres': genres,
      'platforms': platforms,
      'description': description,
      'screenshots': screenshots,
      'cover': cover,
    };
  }
}
