import 'package:flutter/material.dart';
import 'package:gameslist/ui/common/filled_text_button.dart';
import 'package:gameslist/ui/views/sign_up/sign_up_validators.dart';
import 'package:gameslist/ui/views/sign_up/sign_up_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'sign_up_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email', validator: SignUpValidators.email),
  FormTextField(name: 'name', validator: SignUpValidators.name),
  FormTextField(name: 'password', validator: SignUpValidators.password),
])
class SignUpView extends StackedView<SignUpViewModel> with $SignUpView {
  const SignUpView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SignUpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Sign Up'),
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
                  border: OutlineInputBorder(),
                ),
                controller: emailController),
            const SizedBox(height: 20),
            TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder()),
                controller: nameController),
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
            FilledTextButton(text: "Sign Up", onPressed: viewModel.signUp),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            TextButton(
              onPressed: viewModel.navigateToSignIn,
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SignUpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignUpViewModel();

  @override
  void onViewModelReady(SignUpViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SignUpViewModel viewModel) {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.onDispose(viewModel);
  }
}
