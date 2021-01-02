import 'package:flutter/material.dart';
import 'package:trop_dart/ui/app.dart';

class TabItem {
  TabItem({
    @required this.tabName,
    @required this.icon,
    @required Widget page,
  }) : _page = page;
  final String tabName;
  final IconData icon;
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  final Widget _page;

  int _index = 0;

  void setIndex(int i) {
    _index = i;
  }

  int get index => _index;

  Widget get page {
    return Visibility(
      visible: _index == AppState.currentTab,
      maintainState: true,
      child: Navigator(
        key: key,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => _page,
          );
        },
      ),
    );
  }
}
