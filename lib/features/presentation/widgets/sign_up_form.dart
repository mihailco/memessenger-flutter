import 'dart:math';

import 'package:flutter/material.dart';
import 'package:statrco/features/presentation/widgets/texts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/auth/auth_cubit.dart';

class SignUpForm extends StatelessWidget {
  //TODO: change to sign up textfields
  SignUpForm({Key? key}) : super(key: key);
  final _firstNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _submitPasswordField = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //firstname
        TextFormField(
          autofocus: true,
          controller: _firstNameController,
          decoration: InputDecoration(
            labelText: 'firstname *',
            prefixIcon: const Icon(
              Icons.person_sharp,
            ),
            prefixIconColor: Colors.black,
            suffixIcon: GestureDetector(
              onTap: () {
                _usernameController.clear();
              },
              child: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
          validator: (str) {
            if (str == null || str.length < 3) {
              return "this is a required field";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 15,
        ),
        //username
        TextFormField(
          autofocus: true,
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: 'Username *',
            prefixIcon: const Icon(
              Icons.person,
            ),
            prefixIconColor: Colors.black,
            suffixIcon: GestureDetector(
              onTap: () {
                _usernameController.clear();
              },
              child: const Icon(
                Icons.close,
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
        //password
        TextFormField(
          autofocus: true,
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password *',
            prefixIcon: const Icon(Icons.key),
            suffixIcon: GestureDetector(
              onTap: () {
                _passwordController.clear();
              },
              child: const Icon(
                Icons.close,
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
        const SizedBox(
          height: 15,
        ),
        //confirm password
        TextFormField(
          key: _submitPasswordField,
          autofocus: true,
          onChanged: (_) => _submitPasswordField.currentState?.validate(),
          decoration: InputDecoration(
            labelText: 'Confirm password *',
            prefixIcon: const Icon(Icons.vpn_key_outlined),
            suffixIcon: GestureDetector(
              onTap: () {
                _passwordController.clear();
              },
              child: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            ),
          ),
          validator: (str) {
            if (str != _passwordController.text) {
              return swearwords[Random().nextInt(swearwords.length)];
            }

            return null;
          },
        ),

        ElevatedButton(onPressed: () {}, child: const Text("Sign up")),
        TextButton(
            onPressed: () {
              context.read<authCubit>().setSignIn();
            },
            child: Text("Do you already have an account?")),
      ],
    ));
  }
}
