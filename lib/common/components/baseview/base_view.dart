import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Aladdin Carpet Store"),
        ),
        body: Center(
          child: child,
        ));
  }
}
