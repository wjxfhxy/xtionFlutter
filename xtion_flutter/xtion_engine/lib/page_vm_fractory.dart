
import 'package:xtion_engine/page_index.dart';
import 'page_central_controller.dart';

class PageVMFactory {

  static final pageIndexs = List<PageIndex>();

  static PageCentralController vmFrom(String pageCode) {

    if(pageIndexs.length <= 0) {

      pageIndexs.add(PageIndex("1036427993012113499", 1));
      pageIndexs.add(PageIndex("1036427993012113500", 1));
      pageIndexs.add(PageIndex("1036427993012113501", 1));
      pageIndexs.add(PageIndex("1036427993012113502", 1));
      pageIndexs.add(PageIndex("1036427993012113503", 1));
      pageIndexs.add(PageIndex("1036427993012113499", 1));
    }

    var pageIndex = pageIndexs.firstWhere((test) => test.pageCode == pageCode, orElse: null);

    return PageCentralController(pageIndex);
  }
}