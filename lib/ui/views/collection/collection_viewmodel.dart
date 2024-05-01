import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/app/app.router.dart';
import 'package:gameslist/model/game.dart';
import 'package:gameslist/model/status.dart';
import 'package:gameslist/services/authentication_service.dart';
import 'package:gameslist/services/game_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CollectionViewModel extends StreamViewModel<List<Game>> {
  final GameService _gameService = locator<GameService>();
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  @override
  Stream<List<Game>> get stream {
    var userId = _authenticationService.getUserId();
    if (userId != null) {
      return _gameService.getGames(userId);
    } else {
      throw Exception('User not authenticated');
    }
  }

  Future<void> onToggleStatus(Game game, Status status) async {
    var userId = _authenticationService.getUserId();
    if (userId != null) await _gameService.toggleStatus(game, status, userId);
  }

  Future<void> onGameSelected(Game game) async {
    await _navigationService.navigateToGameDetailsView(gameId: game.id);
  }
}
