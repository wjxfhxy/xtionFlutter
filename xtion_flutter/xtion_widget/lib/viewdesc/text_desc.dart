import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/view_desc.dart';
import 'package:xtion_engine_widget/text_align_desc.dart';
import 'package:xtion_engine_widget/number_desc.dart';
import 'package:xtion_engine_widget/color_desc.dart';

class TextDesc extends ViewDesc {

  var lineNumber = NumberDesc.defaultValue(null);

  var textColor = ColorDesc.defaultValue(Colors.black);

  var fontSize = NumberDesc.defaultValue(14);

  var value = "";

  var borderVisible = NumberDesc.defaultValue(0);

  TextAlignDesc textAlign = TextAlignDesc.defalutValue(TextAlign.left);
}