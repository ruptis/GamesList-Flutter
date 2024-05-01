import 'package:gameslist/model/user.dart';

abstract class UserService {
  Stream<User?> getUser(String userId);
  Future<void> createUser(String userId, String name, String email);
  Future<void> updateUser(User user);
}
