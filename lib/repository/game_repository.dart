import 'package:gameslist/dto/game_dto.dart';

abstract class GameRepository {
  Stream<List<GameDto>> getGames();
  Stream<GameDto> getGame(String gameId);
}
