
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:xtion_common_component/ent_login/widget/enterprise_text_input_controller.dart';
import 'package:xtion_service/multi_platform_config/multi_platform_config.dart';
import 'package:xtion_misc/CompletionCallback.dart';

class EnterpriseLoginController {

  var enterpriseTextInputController = EnterpriseTextInputController();

  var entLoginCompletionCallback = CompletionCallback<String>();

  EnterpriseLoginController() {

    enterpriseTextInputController.startAnimation = (entName) {

      _login(entName);
    };
  }

  void _login(String entName) {

    MultiPlatformConfig.setIPPort("http://mconfig.xtion.net", "8015");
    MultiPlatformConfig.refreshMultiPlatConfigRequest(entName).then((value) {

      if(enterpriseTextInputController.stopAnimation != null) {
        enterpriseTextInputController.stopAnimation();
      }

      entLoginCompletionCallback.successedCallback("");
    });
  }

  void loadEntName() async {

    var config = await MultiPlatformConfig.loadMultiplatConfig();
    var name = config["name"] as String ?? "";
    enterpriseTextInputController.entNameController.text = name;
  }
}


// abstract class BlocBase {
//   void dispose();
// }
//
// class BlocProvider<T extends BlocBase> extends StatefulWidget {
//
//   final T bloc;
//
//   final Widget widget;
//
//   BlocProvider(this.bloc, this.widget): super();
//
//   @override
//   State<StatefulWidget> createState() {
//
//     return BlocProviderState();
//   }
//
//   static T of<T extends BlocBase>(BuildContext context) {
//
//     BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
//     return provider.bloc;
//   }
// }
//
// class BlocProviderState extends State<BlocProvider> {
//   @override
//   Widget build(BuildContext context) {
//
//     return widget.widget;
//   }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//
//     widget.bloc.dispose();
//   }
// }
//
// class EnterpriseLoginBLoC {
//
//   StreamController<String> controller = StreamController.broadcast();
//
//   Stream<String> get resultStream => controller.stream;
//
//   dispose() {
//
//     controller.close();
//   }
//
//   void _login(String entName) {
//
//     MultiPlatformConfig.setIPPort("http://mconfig.xtion.net", "8015");
//     MultiPlatformConfig.refreshMultiPlatConfigRequest(entName).then((value) {
//
//
//     });
//   }
//
//   void loadEntName() async {
//
//     var config = await MultiPlatformConfig.loadMultiplatConfig();
//     var name = config["name"] as String ?? "";
//
//     controller.add(name);
//   }
// }