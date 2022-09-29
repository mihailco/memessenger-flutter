import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth/auth_cubit.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    Key? key,
  }) : super(key: key);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          autofocus: true,
          controller: _usernameController,
          onEditingComplete: () {},
          decoration: InputDecoration(
            labelText: 'Username *',
            prefixIcon: const Icon(Icons.person),
            suffixIcon: GestureDetector(
              onTap: () {
                _usernameController.clear();
              },
              child: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
          ),
          validator: (str) {
            if (str == null) {
              return "this is a required field";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 15,
        ),
        TextFormField(
          autofocus: true,
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password *',
            prefixIcon: const Icon(Icons.person),
            suffixIcon: GestureDetector(
              onTap: () {
                _passwordController.clear();
              },
              child: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
          ),
          validator: (str) {
            if (str == null) {
              return "this is a required field";
            }
            if (str.length <= 8) {
              return "password must be at least 8 characters long";
            }
            return null;
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        ElevatedButton(
            onPressed: () {
              context
                  .read<authCubit>()
                  .signIn(_usernameController.text, _passwordController.text);
            },
            child: const Text("Sign in")),
        TextButton(
            onPressed: () {
              context.read<authCubit>().setSignUp();
            },
            child: const Text( "Want to create a new account?")),
      ],
    ));
  }
}
