import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/dto/collection_item_dto.dart';
import 'package:gameslist/dto/game_dto.dart';
import 'package:gameslist/dto/platform_dto.dart';
import 'package:gameslist/mapper/game_mapper.dart';
import 'package:gameslist/mapper/platform_mapper.dart';
import 'package:gameslist/model/game.dart';
import 'package:gameslist/model/status.dart';
import 'package:gameslist/repository/collection_repository.dart';
import 'package:gameslist/repository/game_repository.dart';
import 'package:gameslist/repository/platform_repository.dart';
import 'package:gameslist/services/game_service.dart';
import 'package:rxdart/rxdart.dart';

class GameServiceImpl implements GameService {
  final GameRepository _gameRepository = locator<GameRepository>();
  final CollectionRepository _collectionRepository =
      locator<CollectionRepository>();
  final PlatformRepository _platformRepository = locator<PlatformRepository>();

  @override
  Stream<List<Game>> getGames(String userId) => CombineLatestStream([
        _gameRepository.getGames(),
        _collectionRepository.observeCollectionItems(userId),
        _platformRepository.getPlatforms()
      ], (values) {
        var games = values[0] as List<GameDto>;
        var collectionItems = values[1] as List<CollectionItemDto>;
        var platforms = values[2] as List<PlatformDto>;

        return games.map((game) {
          var gamePlatforms = game.platforms
              .map((platform) => platforms
                  .firstWhere((element) => element.id == platform)
                  .toModel())
              .toList();
          var status = collectionItems
              .where((element) => element.gameId == game.id)
              .firstOrNull
              ?.status;
          return game.toModel(gamePlatforms, status);
        }).toList();
      });

  @override
  Stream<Game> getGame(String gameId, String userId) => CombineLatestStream([
        _gameRepository.getGame(gameId),
        _collectionRepository.observeCollectionItem(userId, gameId),
        _platformRepository.getPlatforms()
      ], (values) {
        var game = values[0] as GameDto;
        var collectionItem = values[1] as CollectionItemDto?;
        var platforms = values[2] as List<PlatformDto>;

        var gamePlatforms = game.platforms
            .map((platform) => platforms
                .firstWhere((element) => element.id == platform)
                .toModel())
            .toList();
        var status = collectionItem?.status;
        return game.toModel(gamePlatforms, status);
      });

  @override
  Future<Status?> toggleStatus(Game game, Status status, String userId) async {
    final newStatus = game.status == status ? null : status;

    if (newStatus == null) {
      await _collectionRepository.removeCollectionItem(userId, game.id);
    } else {
      await _collectionRepository.addCollectionItem(
          userId, CollectionItemDto(gameId: game.id, status: newStatus));
    }

    return newStatus;
  }
}
