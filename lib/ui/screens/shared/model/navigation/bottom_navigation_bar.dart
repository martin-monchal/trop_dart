import 'package:flutter/material.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/shared/model/navigation/tab_item.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({
    this.onSelectTab,
    this.tabs,
  });

  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  @override
  _BottomNavigation createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textColorGrey,
      items: widget.tabs
          .map(
            (TabItem tab) => _buildItem(
              index: tab.index,
              icon: tab.icon,
              tabName: tab.tabName,
            ),
          )
          .toList(),
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onSelectTab(index);
      },
      currentIndex: _currentIndex,
    );
  }

  BottomNavigationBarItem _buildItem(
      {int index, IconData icon, String tabName}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: tabName,
    );
  }
}
