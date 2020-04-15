import 'package:flutter/material.dart';
import 'package:xtion_engine/page_file_store.dart';
import 'package:xtion_engine/page_central_controller.dart';
import 'page_vm_fractory.dart';
import 'package:path_provider/path_provider.dart';

class PageCentralWidget extends StatefulWidget {

  var pageCode = "";

  PageCentralWidget(this.pageCode) : super() {

  }

  @override
  _PageCentralWidgetState createState() => _PageCentralWidgetState();
}

class _PageCentralWidgetState extends State<PageCentralWidget> {

  PageCentralController pcc;

  @override
  void initState() {
    super.initState();

    initPageIndexStore();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(



          title: pcc?.titleView ?? Text(""),
          centerTitle: true,
        ),
        body: Column(

          children: <Widget>[pcc?.rootView ?? Container(
            color: Colors.white,
          )],
        )
    );
  }

  initPageIndexStore() async {

    final path = (await getApplicationDocumentsDirectory()).path + "/Pages";

    PageFileStore.init(path);

    loadPageContent();
  }

  loadPageContent() {

    pcc = PageVMFactory.vmFrom(widget.pageCode);
    pcc.loadPage((c) => {

    });

    setState(() {

    });
  }
}