
import 'package:xtion_engine_widget/string_desc.dart';
import 'package:xtion_engine_widget/size_desc.dart';

import 'view_desc.dart';

class TitleViewDesc extends ViewDesc {

  var title = "";

  var value = "";

  var placeholder = "";

  StringDesc required = StringDesc.defaultValue("0");

  StringDesc readOnly = StringDesc.defaultValue("0");

  TitleViewDesc() : super() {

    size = SizeDesc.defaultValue(null, 40);
  }
}