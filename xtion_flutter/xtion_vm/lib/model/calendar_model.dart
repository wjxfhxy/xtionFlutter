import 'package:xtion_engine/model/uimodel/view_model.dart';
import 'package:xtion_engine/vm/view_vm.dart';
import 'package:xtion_widget/viewdesc/calendar_desc.dart';
import '../vm/calendar_vm.dart';

class CalendarModel extends ViewModel {

  CalendarModel.fromJSON(Map<String, dynamic> content): super.fromJSON(content) {

    var desc = viewDescription as CalendarDesc;
  }

  @override
  allocViewDescription() => CalendarDesc();

  @override
  ViewVM createVM() {

    return CalendarVM.fromViewModel(this);
  }
}