
import 'package:flutter/material.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';
import 'package:xtion_engine_widget/number_desc.dart';
import 'package:xtion_engine_widget/color_desc.dart';
import 'package:xtion_engine_widget/edge_inset_desc.dart';
import 'package:xtion_engine_widget/size_desc.dart';
import 'package:xtion_engine_widget/string_desc.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';


class ViewDesc {

  NumberDesc flex = NumberDesc.defaultValue(0);

  NumberDesc flexGrow = NumberDesc.defaultValue(0);

  var hidden = StringDesc.defaultValue("0");

  var displayMode = DisplayModeDesc.defaultValue(DisplayMode.plain);

  var backgroundColor = ColorDesc.defaultValue(Colors.white);

  var textColor = ColorDesc.defaultValue(Colors.black);

  var padding = EdgeInsetDesc.defaultValue(null, null, null, null);

  var margin = EdgeInsetDesc.defaultValue(null, null, null, null);

  var maxSize = SizeDesc.defaultValue(null, null);

  var size = SizeDesc.defaultValue(null, null);

  FlexDirectionDesc parantFlexDirection = FlexDirectionDesc("");
}