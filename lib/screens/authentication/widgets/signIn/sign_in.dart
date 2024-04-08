import 'package:flutter/material.dart';
import 'package:gameslist/screens/authentication/widgets/signIn/sign_in_view_model.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<SignInViewModel>();
    return Container();
  }
}
