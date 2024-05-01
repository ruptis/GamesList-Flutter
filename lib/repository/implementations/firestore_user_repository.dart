import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gameslist/dto/user_dto.dart';
import 'package:gameslist/repository/user_repository.dart';

class FirestoreUserRepository implements UserRepository {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");

  @override
  Future<UserDto?> createUser(UserDto user) async {
    await _usersCollection.doc(user.id).set(user.toJson());
    return user;
  }

  @override
  Stream<UserDto?> getUser(String userId) =>
      _usersCollection.doc(userId).snapshots().map((snapshot) {
        if (snapshot.exists) {
          return UserDto.fromJson(
              snapshot.data() as Map<String, dynamic>, snapshot.id);
        } else {
          return null;
        }
      });

  @override
  Future<UserDto?> updateUser(UserDto user) async {
    await _usersCollection.doc(user.id).update(user.toJson());
    return user;
  }
}
