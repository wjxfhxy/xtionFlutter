import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xtion_flutter/welcome_interaction.dart';
import 'package:xtion_service/multi_platform_config/multi_platform_config.dart';
import 'package:xtion_ui/navigator_bloc_provider.dart';
import 'package:xtion_vm/xtionVMInit.dart';
import 'package:xtion_engine/page_central_widget.dart';
import 'package:xtion_common_component/ent_login/enterprise_login_interaction.dart';
import 'package:xtion_common_component/login/login_interaction.dart';

void main() {

  xtionVMInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  var isInit = true;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //EnterpriseLoginInteraction()//PageCentralWidget("1036427993012113499"),
      // Navigator(pages:
      // [
      //   MaterialPage(
      //       child: EnterpriseLoginInteraction()
      //   ),
      //   // MaterialPage(
      //   //     child: LoginInteraction()
      //   // )
      // ]
      //     ,
      // onPopPage: (route, result) {
      //
      //   return true;
      // })
      NavigatorBlocProvider(initialPages: List()..add(WelcomePage()))

    );
  }
}

// class NavigatorBlocProvider extends StatefulWidget {
//
//   var streamController = StreamController.broadcast();
//
//   @override
//   State<StatefulWidget> createState() {
//
//     return NavigatorBlocProviderState();
//   }
//
//   static NavigatorBlocProvider of(BuildContext context) {
//
//     var provider = context.findAncestorWidgetOfExactType<NavigatorBlocProvider>();
//     return provider;
//   }
//
//   push() {
//
//     streamController.add("");
//   }
// }
//
// class NavigatorBlocProviderState extends State<NavigatorBlocProvider> {
//
//   @override
//   void initState() {
//     super.initState();
//
//     widget.streamController.onListen = updateNavigator;
//   }
//
//   @override
//   void dispose() {
//
//     widget.streamController.close();
//
//     super.dispose();
//   }
//
//   updateNavigator() {
//
//     setState(() {
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Navigator(pages: [
//       MaterialPage(
//           child: EnterpriseLoginInteraction()
//       ),
//       // MaterialPage(
//       //     child: LoginInteraction()
//       // )
//     ],
//         onPopPage: (route, result) {
//           return true;
//         });
//   }
// }

//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  // This widget is the home page of your application. It is stateful, meaning
//  // that it has a State object (defined below) that contains fields that affect
//  // how it looks.
//
//  // This class is the configuration for the state. It holds the values (in this
//  // case the title) provided by the parent (in this case the App widget) and
//  // used by the build method of the State. Fields in a Widget subclass are
//  // always marked "final".
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  @override
//  void initState() {
//    super.initState();
//
//
//  }
//
//  void _incrementCounter() {
//    setState(() {
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      appBar: AppBar(
//
//        title: Text(widget.title),
//      ),
//      body: Center(
//
//        child: PageCentralWidget("1036427993012113499"),
//      )
//    );
//  }
//}
