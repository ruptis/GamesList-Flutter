abstract class AuthenticationService {
  Stream<String?> get userId;
  String? getUserId();
  bool get isUserLoggedIn;
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String name, String password);
  Future<void> signOut();
}
