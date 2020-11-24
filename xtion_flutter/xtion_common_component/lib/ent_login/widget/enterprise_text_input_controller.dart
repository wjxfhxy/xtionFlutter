

import 'package:flutter/cupertino.dart';

class EnterpriseTextInputController {

  TextEditingController entNameController = TextEditingController();

  void Function() stopAnimation;

  void Function(String entName) startAnimation;
}