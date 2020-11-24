
import 'package:flutter/material.dart';

MaterialPage LoginPage() {

  return MaterialPage(
      key: ValueKey('LoginInteraction'),
      child: LoginInteraction()
  );
}

class LoginInteraction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginInteractionState();
}

class _LoginInteractionState extends State<LoginInteraction> {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(

          title: Text("@@"),
        ),
        body: Column(
          children: <Widget>[
            Text("!!!!!!!!!!!!!!")
          ],
        ));
  }
}