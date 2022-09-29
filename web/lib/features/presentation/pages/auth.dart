// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:statrco/features/presentation/cubit/auth/auth_state.dart';
import 'package:statrco/features/presentation/widgets/sign_in_form.dart';
import 'package:statrco/features/presentation/widgets/sign_up_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return Center(child: ColumnForForms());
          } else {
            return Row(
              children: [
                const Spacer(),
                Center(
                    child: Container(
                  width: 600,
                  child: ColumnForForms(),
                )),
                const Spacer(),
              ],
            );
          }
        },
      ),
    );
  }
}

class ColumnForForms extends StatelessWidget {
  final _formKeySignUp = GlobalKey<FormState>();
  final _formKeySignIn = GlobalKey<FormState>();

  ColumnForForms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<authCubit>().setSignUp();
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        Container(
          margin: const EdgeInsets.all(45),
          padding: const EdgeInsets.fromLTRB(20, 35, 20, 5),
          decoration: const BoxDecoration(
              color: Color.fromARGB(115, 4, 21, 37),
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Column(children: [
            BlocBuilder<authCubit, authState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: () {
                      if (state is SignUpState) return SignUpForm();
                      if (state is SignInState) return SignInForm();
                      if (state is loadingState) {
                        return const Expanded(
                            child: CircularProgressIndicator());
                      }
                      if (state is LoginCompletedState) {
                        return Text(state.token);
                      }
                      if (state is error_state) {
                        return const Expanded(child: Text("error"));
                      }
                    }());
              },
            ),
          ]),
        ),
        const Spacer(
          flex: 6,
        )
      ],
    );
  }
}
