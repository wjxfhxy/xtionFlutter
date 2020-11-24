
import 'dart:async';

import 'package:flutter/cupertino.dart';

class NavigatorBlocProvider extends StatefulWidget {

  StreamController<_Config> streamController = StreamController.broadcast();

  var pages = List<Page<dynamic>>();

  NavigatorBlocProvider({@required List<Page<dynamic>> initialPages}) {

    pages.addAll(initialPages);
  }

  @override
  State<StatefulWidget> createState() {

    return NavigatorBlocProviderState();
  }

  static NavigatorBlocProvider of(BuildContext context) {

    var provider = context.findAncestorWidgetOfExactType<NavigatorBlocProvider>();
    return provider;
  }

  push(Page page) {

    var config = _PushConfig(page);
    streamController.add(config);
  }

  replace(Page page, {int count = 1}) {

    var config = _ReplaceConfig(page, count: count);
    streamController.add(config);
  }
}

class NavigatorBlocProviderState extends State<NavigatorBlocProvider> {

  StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();

    _streamSubscription = widget.streamController.stream.listen(updateNavigator);
  }

  @override
  void dispose() {

    _streamSubscription.cancel();
    widget.streamController.close();

    super.dispose();
  }

  updateNavigator(_Config config) {
    
    switch(config.type) {
      
      case _Type.push: {
        
        widget.pages.add(config.page);
        
        break;
      }
      case _Type.replace: {

        var c = config as _ReplaceConfig;

        var len = widget.pages.length;

        widget.pages.removeRange(len - c.count, len);
        
        widget.pages.add(c.page);

        break;
      }
    }

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Navigator(pages: List()..addAll(widget.pages),
      // MaterialPage(
      //     child: LoginInteraction()
      // )
        onPopPage: (route, result) {
          return true;
        });
  }
}

enum _Type {

  push,
  replace
}

class _Config {

  Page page;

  _Type type;

  _Config(this.type, {this.page});
}

class _PushConfig extends _Config {

  _PushConfig(Page page) : super(_Type.push, page: page);
}

class _ReplaceConfig extends _Config {

  int count = 1;

  _ReplaceConfig(Page page, {this.count = 1}) : super(_Type.replace, page: page);
}