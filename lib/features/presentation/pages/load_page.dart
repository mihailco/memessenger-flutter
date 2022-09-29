import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:statrco/features/presentation/widgets/gradient_text.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({Key? key}) : super(key: key);

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  
  void initState() {
    //TODO add check jwt 
    super.initState();
    if(true){
    Future.delayed(const Duration(seconds : 1), ()=>Navigator.pushNamed(context, '/auth'));
    }
  }

  @override
  Widget build(BuildContext context) {
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
                child: SizedBox(
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
  }
}


    // BlocBuilder<startedCubit, startedState>(
    //   builder: (context, state) {
    //     if (state is authInState ||state is authUpState) {
    //       return  AuthPage();
    //     } else if (state is error_state) {}

    //     return  AuthPage();//TODO change on load
    //   },
    // );
  
