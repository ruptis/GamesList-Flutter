import 'package:gameslist/dto/game_dto.dart';
import 'package:gameslist/model/game.dart';
import 'package:gameslist/model/platform.dart';
import 'package:gameslist/model/status.dart';
import 'package:intl/intl.dart';

extension GameDtoMapper on GameDto {
  Game toModel(List<Platform> platforms, Status? status) => Game(
      id: id,
      title: title,
      developer: developer,
      publisher: publisher,
      releaseDate: _inputFormat.parse(releaseDate),
      genres: genres,
      platforms: platforms,
      description: description,
      screenshots: screenshots,
      cover: cover,
      status: status);

  static final DateFormat _inputFormat =
      DateFormat("mm/dd/yyyy HH:mm:ss a zzz");
}
