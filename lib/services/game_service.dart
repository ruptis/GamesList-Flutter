import 'package:gameslist/model/game.dart';
import 'package:gameslist/model/status.dart';

abstract class GameService {
  Stream<List<Game>> getGames(String userId);
  Stream<Game> getGame(String gameId, String userId);

  Future<Status?> toggleStatus(Game game, Status status, String userId);
}
