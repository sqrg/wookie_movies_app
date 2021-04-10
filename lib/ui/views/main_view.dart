import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'package:wookie_movies_app/core/viewmodels/main_viewmodel.dart';

import 'package:wookie_movies_app/ui/views/movies_view.dart';
import 'package:wookie_movies_app/ui/views/search_view.dart';

class MainView extends StatefulWidget {
  static const routeName = 'main';

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> with TickerProviderStateMixin {
  TabController tabController;

  var tabsList = [
    MoviesView(),
    SearchView(),
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      vsync: this,
      length: tabsList.length,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      tabController.animateTo(index);
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      onModelReady: (vm) => vm.initialize(),
      builder: (context, vm, child) => DefaultTabController(
        length: tabsList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Wookie Movies'),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Use dark theme'),
                      Switch(
                          value: vm.isDarkModeEnabled,
                          onChanged: (bool newValue) {
                            vm.changeTheme(newValue);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(
            // This prevents the user to side-scroll tabs
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: tabsList,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => onTabTapped(index),
            currentIndex: _currentIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            ],
          ),
        ),
      ),
    );
  }
}
