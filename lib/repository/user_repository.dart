import 'package:gameslist/dto/user_dto.dart';

abstract class UserRepository {
  Stream<UserDto?> getUser(String userId);
  Future<UserDto?> createUser(UserDto user);
  Future<UserDto?> updateUser(UserDto user);
}
