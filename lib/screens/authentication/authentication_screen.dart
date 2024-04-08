import 'package:flutter/material.dart';
import 'package:gameslist/screens/authentication/widgets/signIn/sign_in.dart';
import 'package:gameslist/screens/authentication/widgets/signIn/sign_in_view_model.dart';
import 'package:provider/provider.dart';

enum AuthenticationState { signIn, signUp }

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen(this.initialState, {super.key});

  final AuthenticationState initialState;

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState(initialState);
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  _AuthenticationScreenState(this._state);

  AuthenticationState _state;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SignInViewModel(),
        child: const SignIn(),
    );
  }
}