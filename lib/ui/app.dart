import 'package:flutter/material.dart';
import 'package:trop_dart/ui/screens/add_beer/add_beer_screen.dart';
import 'package:trop_dart/ui/screens/homepage/homepage_screen.dart';
import 'package:trop_dart/ui/screens/list_beers/list_beers_screen.dart';
import 'package:trop_dart/ui/screens/profile/bloc/profile_bloc.dart';
import 'package:trop_dart/ui/screens/profile/profile_screen.dart';
import 'package:trop_dart/ui/screens/shared/bloc/app_bloc.dart';
import 'package:trop_dart/ui/screens/shared/model/navigation/bottom_navigation_bar.dart';
import 'package:trop_dart/ui/screens/shared/model/navigation/tab_item.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  static int currentTab = 0;

  final List<TabItem> tabs = [
    TabItem(
      tabName: 'Home',
      icon: Icons.home,
      page: HomePageScreen(),
    ),
    TabItem(
      tabName: 'List',
      icon: Icons.list,
      page: ListBeersScreen(),
    ),
    TabItem(
      tabName: 'Add',
      icon: Icons.local_drink,
      page: AddBeerScreen(),
    ),
    TabItem(
      tabName: 'Profile',
      icon: Icons.people,
      page: ProfileScreen(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabs.asMap().forEach((int index, TabItem tab) {
      tab.setIndex(index);
    });
  }

  void _selectTab(int index) {
    if (index == currentTab) {
      tabs
          .elementAt(index)
          .key
          .currentState
          .popUntil((Route<dynamic> route) => route.isFirst);
    } else {
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (BuildContext context) => AppBloc(),
      child: WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await tabs[currentTab].key.currentState.maybePop();
          if (isFirstRouteInCurrentTab) {
            if (currentTab != 0) {
              _selectTab(0);
              return false;
            }
          }
          return isFirstRouteInCurrentTab;
        },
        child: Scaffold(
          body: IndexedStack(
            index: currentTab,
            children: tabs.map((TabItem tab) => tab.page).toList(),
          ),
          bottomNavigationBar: BottomNavigation(
            onSelectTab: _selectTab,
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}
