
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_desc.dart';
import 'package:xtion_engine_widget/color_desc.dart';
import 'package:xtion_engine_widget/size_desc.dart';

class ButtonDesc extends ViewDesc {

  var title = "";

  ButtonDesc() : super() {

    backgroundColor = ColorDesc.defaultValue(Colors.blue);
    textColor = ColorDesc.defaultValue(Colors.white);
    size = SizeDesc.defaultValue(null, 40);
  }
}