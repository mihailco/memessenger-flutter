import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/cubit/onAppStarted/started_cubit.dart';
import 'package:statrco/features/presentation/cubit/onAppStarted/started_state.dart';
import 'package:statrco/features/presentation/pages/auth.dart';
import 'package:statrco/features/presentation/widgets/gradient_text.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    context.read<startedCubit>().chekJWT();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
            Color.fromARGB(255, 51, 49, 44),
            Colors.black,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                    height: min(MediaQuery.of(context).size.height,
                            MediaQuery.of(context).size.width) /
                        1.7,
                    width: min(MediaQuery.of(context).size.height,
                            MediaQuery.of(context).size.width) /
                        1.7,
                    child: Image.asset("assets/photos/med.png")),
              ),
            ),
            const GradientText("@mihailco",
                style: TextStyle(fontSize: 22, fontFamily: "Gothic"),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 231, 209, 7),
                  Color.fromARGB(255, 150, 137, 24),
                ])),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
    
    // BlocBuilder<startedCubit, startedState>(
    //   builder: (context, state) {
    //     if (state is authInState ||state is authUpState) {
    //       return  AuthPage();
    //     } else if (state is error_state) {}

    //     return  AuthPage();//TODO change on load
    //   },
    // );
  }
}