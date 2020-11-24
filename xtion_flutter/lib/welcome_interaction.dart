
import 'package:flutter/material.dart';
import 'package:xtion_common_component/ent_login/enterprise_login_interaction.dart';
import 'package:xtion_common_component/login/login_interaction.dart';
import 'package:xtion_service/multi_platform_config/multi_platform_config.dart';
import 'package:xtion_ui/navigator_bloc_provider.dart';

MaterialPage WelcomePage() {

  return MaterialPage(
      key: ValueKey('WelcomeInteraction'),
      child: WelcomeInteraction()
  );
}

class WelcomeInteraction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

//     // 隐藏底部按钮栏
//     SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);
//
// // 隐藏状态栏
//     SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
//
// // 隐藏状态栏和底部按钮栏
//     SystemChrome.setEnabledSystemUIOverlays ([]);

    MultiPlatformConfig.loadMultiplatConfig().then((value) {

      if(value == null || value.length <= 0) {
        NavigatorBlocProvider.of(context).replace(EnterpriseLoginPage());
      }
      else {
        NavigatorBlocProvider.of(context).replace(LoginPage());
      }
    });

    return Column( children: [Expanded(child: Image.asset("images/bg_start.jpg")) ],);
  }
}