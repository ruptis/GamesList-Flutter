import 'package:flutter/cupertino.dart';
import 'package:gameslist/app/locator_configuration.dart';
import 'package:gameslist/service/auth_service.dart';

class SignInViewModel extends ChangeNotifier {
  final AuthenticationService _service = locator();

  String _email = "";

  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  void signIn() async {
    _service.signIn();
  }
}