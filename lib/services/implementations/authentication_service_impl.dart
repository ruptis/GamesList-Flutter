import 'package:firebase_auth/firebase_auth.dart';
import 'package:gameslist/app/app.locator.dart';
import 'package:gameslist/services/authentication_service.dart';
import 'package:gameslist/services/user_service.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserService _userService = locator<UserService>();

  @override
  String? getUserId() => _firebaseAuth.currentUser?.uid;

  @override
  Future<String> signIn(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<String> signUp(String email, String name, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = userCredential.user!;
    try {
      await _userService.createUser(user.uid, name, email);
    } catch (e) {
      await user.delete();
      rethrow;
    }
    return user.uid;
  }

  @override
  Stream<String?> get userId =>
      _firebaseAuth.authStateChanges().map((user) => user?.uid);

  @override
  bool get isUserLoggedIn => _firebaseAuth.currentUser != null;
}
