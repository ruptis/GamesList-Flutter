import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/model/game.dart';
import 'package:gameslist/model/status.dart';
import 'package:gameslist/services/authentication_service.dart';
import 'package:gameslist/services/game_service.dart';
import 'package:stacked/stacked.dart';

class GameDetailsViewModel extends StreamViewModel<Game> {
  final GameService _gameService = locator<GameService>();
  final _authenticationService = locator<AuthenticationService>();
  final String gameId;

  GameDetailsViewModel(this.gameId);

  @override
  Stream<Game> get stream {
    var userId = _authenticationService.getUserId();
    if (userId != null) {
      return _gameService.getGame(gameId, userId);
    } else {
      throw Exception('User not authenticated');
    }
  }

  Future<void> onToggleStatus(Status status) async {
    var userId = _authenticationService.getUserId();
    if (userId != null) await _gameService.toggleStatus(data!, status, userId);
  }
}
