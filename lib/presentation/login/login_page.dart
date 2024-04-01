import 'package:alindor_assessment/app/di.dart';
import 'package:alindor_assessment/app/extensions/app_extension.dart';
import 'package:alindor_assessment/presentation/login/cubit/login_cubit.dart';
import 'package:alindor_assessment/presentation/login/cubit/login_state.dart';
import 'package:alindor_assessment/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => instance<LoginCubit>(),
      child: const LoginPageView(),
    );
  }
}

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $color.recorderBackground,
      body: SafeArea(
        child: BlocListener<LoginCubit, LoginState>(
          listenWhen: (prevState, nextState) {
            if (prevState is LoginStateLoading) {
              context.dismissLoader();
            }
            return true;
          },
          listener: (context, state) {
            if (state is LoginStateLoading) {
              context.showLoader();
            }

            if (state is LoginStateFailure) {
              context.showErrorAlert(state.message);
            }

            if (state is LoginStateSuccess) {
              context.pushReplacement(ScreenPaths.recorder);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SignInButton(
                  Buttons.google,
                  text: "Sign up with Google",
                  onPressed: () {
                    context.read<LoginCubit>().login();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
