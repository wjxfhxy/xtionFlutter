import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_vm/model/layout_model.dart';
import 'package:xtion_engine_widget/displaymode_desc.dart';
import 'package:xtion_engine_widget/flex_direction_desc.dart';
import '../vm/row_vm.dart';

class RowModel extends ViewModel {

  var title = "";

  RowModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    subViewModelTree.forEach((f) {
      if(f is LayoutModel) {
        f.overflow = "0";
      }
    });

//    if(subViewModelTree != null)
//      subViewModelTree.forEach((f) => f.viewDescription.parantFlexDirection = FlexDirectionDesc(""));

    subViewModelList.forEach((f) =>
      f.viewDescription.displayMode = DisplayModeDesc.defaultValue(DisplayMode.basic)
    );
  }

  @override
  ViewVM createVM() {

    return RowVM.fromViewModel(this);
  }
}