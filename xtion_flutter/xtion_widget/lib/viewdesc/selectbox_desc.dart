
import 'package:xtion_engine_widget/number_desc.dart';
import 'package:xtion_engine_widget/title_view_desc.dart';
import 'package:xtion_engine_widget/size_desc.dart';
import 'package:xtion_engine_widget/option_desc.dart';

class SelectBoxDesc extends TitleViewDesc {

  var colnum = NumberDesc.defaultValue(0);

  var options = OptionDesc.defaultValue();

  SelectBoxDesc() : super() {

    size = SizeDesc.defaultValue(null, null);
  }
}