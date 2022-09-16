// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:statrco/features/presentation/cubit/onAppStarted/started_state.dart';
import 'package:statrco/injection.dart';

import '../widgets/Animated_list_model.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Flexible(child: Container()),
          Flexible(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 5),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(115, 4, 21, 37),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: const AnimatedForm(),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedForm extends StatefulWidget {
  const AnimatedForm({super.key});

  @override
  State<AnimatedForm> createState() => _AnimatedFormState();
}

class _AnimatedFormState extends State<AnimatedForm> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  late ListModel<Widget> _list;
  int? _selectedItem;
  late int _nextItem;
  // ignore: prefer_final_fields
  @override
  void initState() {
    super.initState();
    _list = ListModel<Widget>(
      listKey: _listKey,
      initialItems: widgetsSignIn,
      removedItemBuilder: ((item, context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: item,
          ),
        );
      }),
    );
  }

  void _insert() {
    for (int i = 0; i < widgetsSignUp.length; i++) {
      _list.insert(_list.length, widgetsSignUp[i]);
    }
  }

  void _remove() {
    int tmpIndex = _list.length;
    for (int i = 2; i < tmpIndex; i++) {
      _list.removeAt(2);
    }
  }

  var widgetsSignIn = <Widget>[
    TextFormField(
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: "username",
        
      ),
    ),
    TextFormField(
      decoration: const InputDecoration(
        labelText: "password",
      ),
    ),
  ];

  var widgetsSignUp = <Widget>[
    TextFormField(
      decoration: const InputDecoration(
        labelText: "Firstname",
      ),
    ),
    TextFormField(
      decoration: const InputDecoration(
        labelText: "Lastname",
      ),
    ),
    TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
      ),
    ),
    TextFormField(
      decoration: const InputDecoration(
        labelText: "Status",
      ),
    ),
    TextFormField(
      decoration: const InputDecoration(
        labelText: "ImageURL",
      ),
    ),
  ];

  int counter = 0;
  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: const EdgeInsets.all(5),
        child: _list[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Flexible(
          flex: 99,
          child: AnimatedList(
            physics: const BouncingScrollPhysics(),
            key: _listKey,
            initialItemCount: widgetsSignIn.length,
            itemBuilder: _buildItem,
          ),
        ),
        const Spacer(),
        Row(children: [
          const Spacer(),
          TextButton(
            onPressed: () {
              _remove();
            },
            child: const Text(
              "sign-in",
              style: TextStyle(fontSize: 19),
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.all(5),
            height: 25,
            width: 2,
          ),
          TextButton(
            onPressed: () {
              _insert(); //TODO
            },
            child: const Text(
              "sign-Up",
              style: TextStyle(fontSize: 19),
            ),
          ),
          const Spacer(),
        ]),
      ],
    ));
  }
}
