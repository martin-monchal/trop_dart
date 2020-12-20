import 'package:flutter/material.dart';
import 'package:trop_dart/ui/app.dart';
import 'package:trop_dart/ui/resources/app_colors.dart';
import 'package:trop_dart/ui/screens/shared/model/navigation/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  BottomNavigation({
    this.onSelectTab,
    this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: tabs
          .map(
            (TabItem tab) => _buildItem(
              index: tab.getIndex(),
              icon: tab.icon,
              tabName: tab.tabName,
            ),
          )
          .toList(),
      onTap: (int index) => onSelectTab(
        index,
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      {int index, IconData icon, String tabName}) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _tabColor(index: index),
        ),
        title: Text(
          tabName,
          style: TextStyle(color: _tabColor(index: index)),
        ));
  }

  Color _tabColor({int index}) {
    return AppState.currentTab == index
        ? AppColors.primary
        : AppColors.textColorGrey;
  }
}
