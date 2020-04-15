import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_vm/model/row_model.dart';
import 'package:xtion_widget/viewdesc/list_desc.dart';
import '../vm/list_vm.dart';

class ListModel extends ViewModel {

  RowModel rowModel;

  ListModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var row = content["rows"];
    if(row != null) {

      rowModel = RowModel.fromJSON(row);
    }
  }

  @override
  allocViewDescription() => ListDesc();

  @override
  ViewVM createVM() {

    return ListVM.fromViewModel(this);
  }
}