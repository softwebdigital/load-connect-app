import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:load_connect/shared/colors.dart';
import 'package:load_connect/view/utils/custom_icons_icons.dart';
import 'package:load_connect/view/utils/helper.dart';
import 'package:unicons/unicons.dart';

import './tabs/all_tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _tabPages = [];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabPages
      ..add(const DashboardTab())
      ..add(const HistoryTab())
      ..add(const FindTrucksTab())
      ..add(const MessagesTab())
      ..add(const SettingsTab());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _showExitDialog,
      child: Scaffold(
        body: _tabPages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          // unselectedFontSize: 0.0,
          elevation: 0.0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // backgroundColor: Colors.red,
          backgroundColor: const Color(0XFFF8FFFA),
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            for (final bottomBarItem in bottomBarItems)
              BottomNavigationBarItem(
                label: "",
                icon: _buildIcon(
                  bottomBarItem['icon'],
                  bottomBarItem['title'],
                  // "Dashboard",
                  bottomBarItems.indexOf(bottomBarItem),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _getBgColor(int index) =>
      _currentIndex == index ? AppColor.yellow : Colors.white;
  Color _getItemColor(int index) => _currentIndex == index
      ? AppColor.darkGreen
      : AppColor.lightgrey.withOpacity(0.8);
  Widget _buildIcon(IconData iconData, String text, int index) => Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        width: double.infinity,
        // height: 120.h,
        height: kBottomNavigationBarHeight.h,
        child: Material(
          color: _getBgColor(index),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: _getItemColor(index),
                  size: 24.0.h,
                ),
                SizeMargin.size(height: 6.0),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0.sp,
                    color: _getItemColor(index),
                  ),
                ),
              ],
            ),
            // onTap: () => _onItemTapped(index),
          ),
        ),
      );

  final List<Map<String, dynamic>> bottomBarItems = [
    {
      "icon": CustomIcons.dashboard,
      "title": "Dashboard",
    },
    {
      "icon": UniconsLine.history,
      "title": "History",
    },
    {
      "icon": UniconsLine.search,
      "title": "Find Trucks",
    },
    {
      "icon": UniconsLine.envelope,
      "title": "Messages",
    },
    {
      "icon": UniconsLine.setting,
      "title": "Settings",
    }
  ];

  Future<bool> _showExitDialog() async {
    if (_currentIndex != 0) {
      setState(() {
        _currentIndex = 0;
      });
      return Future.value(false);
    }
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text(
            "Load Connect",
            style: TextStyle(
              fontSize: 20,
              color: AppColor.primaryColor,
            ),
          ),
          content: const Text(
            "Are you sure you want to exit ?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 0.0,
              textColor: AppColor.white100,
              color: AppColor.primaryColor,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("NO"),
            ),
            MaterialButton(
              elevation: 0.0,
              textColor: AppColor.primaryColor,
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              child: const Text("YES"),
            ),
          ],
        );
      },
    );
    if (result == null) return false;
    return result;
  }
}
