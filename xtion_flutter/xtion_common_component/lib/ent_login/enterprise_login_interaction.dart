
import 'package:flutter/material.dart';
import 'package:xtion_common_component/ent_login/enterprise_login_controller.dart';
import 'package:xtion_common_component/ent_login/widget/enterprise_text_input.dart';
import 'package:xtion_common_component/login/login_interaction.dart';
import 'package:xtion_ui/navigator_bloc_provider.dart';

MaterialPage EnterpriseLoginPage() {

  return MaterialPage(
      key: ValueKey('EnterpriseLoginInteraction'),
      child: EnterpriseLoginInteraction()
  );
}

// class EnterpriseLoginPage extends MaterialPage {
//
//   EnterpriseLoginPage() : super();
//
//   Route createRoute(BuildContext context) {
//     return MaterialPageRoute(
//       settings: this,
//       builder: (BuildContext context) {
//         return EnterpriseLoginInteraction();
//       },
//     );
//   }
// }

class EnterpriseLoginInteraction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EnterpriseLoginInteractionState();
}

class _EnterpriseLoginInteractionState extends State<EnterpriseLoginInteraction> {

  var enterpriseLoginController = EnterpriseLoginController();

//  var bloc = EnterpriseLoginBLoC();

  @override
  void initState() {
    super.initState();

    enterpriseLoginController.loadEntName();

  //  bloc.loadEntName();
  }

  @override
  void dispose() {
    super.dispose();

  //  bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {

    enterpriseLoginController.entLoginCompletionCallback.successedCallback = (r) {

      NavigatorBlocProvider.of(context).replace(LoginPage());
    };

    enterpriseLoginController.entLoginCompletionCallback.failCallback = () {

    };

    return Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset("images/login/ent_bg.jpg",
                      package: 'xtion_common_component'),
                )
              ],
            ),
            Container(margin:EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: EnterpriseTextInput(enterpriseLoginController.enterpriseTextInputController),)
          ],
        ));
  }

  // @override
  // Widget build(BuildContext context) {
  //
  //   return Scaffold(
  //       body: Column(
  //         children: <Widget>[
  //           Row(
  //             children: <Widget>[
  //               Expanded(
  //                 child: Image.asset("images/login/ent_bg.jpg",
  //                     package: 'xtion_common_component'),
  //               )
  //             ],
  //           ),
  //           Container(margin:EdgeInsets.fromLTRB(30, 30, 30, 0),
  //             child: EnterpriseTextInput(enterpriseLoginController.enterpriseTextInputController),),
  //           StreamBuilder<String>(
  //             stream: bloc.resultStream,
  //               initialData: "1111",
  //               // ignore: missing_return
  //               builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
  //
  //           })
  //         ],
  //       ));
  // }
}
