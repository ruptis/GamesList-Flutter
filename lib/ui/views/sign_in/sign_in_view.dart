import 'package:flutter/material.dart';
import 'package:gameslist/ui/common/filled_text_button.dart';
import 'package:gameslist/ui/views/sign_in/sign_in_validators.dart';
import 'package:gameslist/ui/views/sign_in/sign_in_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'sign_in_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: SignInValidators.email),
  FormTextField(name: 'password', validator: SignInValidators.password),
])
class SignInView extends StackedView<SignInViewModel> with $SignInView {
  const SignInView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SignInViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 36, right: 36, bottom: 86),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    fillColor: Colors.red,
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: emailController),
            const SizedBox(height: 20),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(viewModel.isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: viewModel.togglePasswordVisibility,
                    )),
                obscureText: !viewModel.isPasswordVisible,
                controller: passwordController),
            const SizedBox(height: 20),
            FilledTextButton(text: "Sign In", onPressed: viewModel.signIn),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(
              onPressed: viewModel.navigateToSignUp,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SignInViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignInViewModel();

  @override
  void onViewModelReady(SignInViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SignInViewModel viewModel) {
    emailController.dispose();
    passwordController.dispose();
    super.onDispose(viewModel);
  }
}
