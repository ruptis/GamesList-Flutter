import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/app/app.logger.dart';
import 'package:gameslist/dto/user_dto.dart';
import 'package:gameslist/mapper/user_mapper.dart';
import 'package:gameslist/model/status.dart';
import 'package:gameslist/model/user.dart';
import 'package:gameslist/repository/collection_repository.dart';
import 'package:gameslist/repository/user_repository.dart';
import 'package:gameslist/services/user_service.dart';
import 'package:rxdart/rxdart.dart';

class UserServiceImpl implements UserService {
  final logger = getLogger('UserServiceImpl');

  final UserRepository _userRepository = locator<UserRepository>();
  final CollectionRepository _collectionRepository =
      locator<CollectionRepository>();

  @override
  Future<void> createUser(String userId, String name, String email) async {
    var user = User.newUser(userId, name, email);
    await _userRepository.createUser(user.toDto());
  }

  @override
  Stream<User?> getUser(String userId) => CombineLatestStream([
        _userRepository.getUser(userId),
        _collectionRepository.observeCollectionItemsCount(userId),
        _collectionRepository.observeCollectionItemsCountByStatus(
            userId, Status.passed),
      ], (values) {
        var userDto = values[0] as UserDto?;
        if (userDto == null) return null;
        var totalGames = values[1] as int;
        var passedGames = values[2] as int;

        logger.i('UserDto: ${userDto.gender}');
        logger.i('Total games: $totalGames');
        logger.i('Passed games: $passedGames');

        var model = userDto.toModel(totalGames, passedGames);
        logger.i('User: ${model.name}');
        return model;
      });

  @override
  Future<void> updateUser(User user) async {
    await _userRepository.updateUser(user.toDto());
  }
}
