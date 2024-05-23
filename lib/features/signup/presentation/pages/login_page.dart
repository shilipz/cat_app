import 'package:cat_app/core/theme/app_pallete.dart';
import 'package:cat_app/core/utils/show_snackbar.dart';
import 'package:cat_app/features/home/presentation/pages/home.dart';
import 'package:cat_app/features/signup/presentation/bloc/login/login_bloc.dart';
import 'package:cat_app/features/signup/presentation/bloc/register/auth_bloc.dart';
import 'package:cat_app/features/signup/presentation/pages/signup_page.dart';
import 'package:cat_app/features/signup/presentation/widgets/auth_field.dart';
import 'package:cat_app/features/signup/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/widgets/loader.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, state.message);
          }
        }, builder: (context, state) {
          if (state is AuthLoading) {
            const Loader();
          }
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Login',
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                AuthField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                AuthField(
                  hintText: 'Password',
                  isObscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                AuthGradientButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginBloc>().add(AuthLogin(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  buttonText: 'Sign in',
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => Navigator.push(context, SignUp.route()),
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                              text: 'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: AppPallete.gradient2,
                                      fontWeight: FontWeight.bold))
                        ]),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    ));
  }
}
