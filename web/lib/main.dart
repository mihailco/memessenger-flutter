import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statrco/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:statrco/features/presentation/pages/auth.dart';
import 'features/presentation/pages/load_page.dart';
import "package:http/http.dart" as http;
import 'injection.dart' as inj;

void main() {
  inj.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => inj.locator<authCubit>())],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark().copyWith(
                //шрифты
                highlightColor: Colors.black,
                textSelectionTheme: const TextSelectionThemeData(
                    cursorColor: Color.fromARGB(255, 1, 175, 166)),
                scaffoldBackgroundColor: const Color.fromARGB(255, 3, 90, 75),

                //textfield
                inputDecorationTheme: InputDecorationTheme(

                  contentPadding: EdgeInsets.all(3),
                  floatingLabelStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 153, 145), fontSize: 18),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 153, 145), width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(162, 0, 138, 131), width: 2),
                      borderRadius: BorderRadius.circular(8)),
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color.fromARGB(255, 0, 153, 145);
                  }
                  return const Color.fromARGB(162, 0, 138, 131);
                })))),
            home: LoadPage(),
            initialRoute: '/',
            routes: {
              '/auth': (context) => AuthPage(),
            }));
  }
}
