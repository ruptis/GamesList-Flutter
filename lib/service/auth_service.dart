
class Dependency {

}

abstract class AuthenticationService {
  void signIn();
}

class AuthenticationServiceImpl implements AuthenticationService {
  final Dependency _dependency;

  AuthenticationServiceImpl(this._dependency);

  @override
  void signIn() {
    // TODO: implement signIn
  }
}