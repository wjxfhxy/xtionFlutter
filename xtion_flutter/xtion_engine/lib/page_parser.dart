
import 'dart:io';
import 'dart:convert';
import 'package:xtion_engine/page_index.dart';
import 'page_file_store.dart';

import 'model/page_model.dart';

class PageParser {

  static parse(PageIndex pageIndex) {

    var pageCode = pageIndex.pageCode;

    var filePath =  PageFileStore.storePath() + "/" + pageCode + ".json" ;

    var file = new File(filePath);
    var content = file.readAsStringSync();

    var jsonMap = json.decode(content);

    PageModel pageModel;

    switch(pageIndex.pageType) {

      case 1:
        pageModel = PageModel.fromJson(jsonMap);
        break;
    }

    return pageModel;
  }
}